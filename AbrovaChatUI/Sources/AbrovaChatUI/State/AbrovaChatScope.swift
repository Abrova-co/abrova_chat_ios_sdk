import SwiftUI
import Combine
import AbrovaChat

/// Environment key for AbrovaChatClient
private struct AbrovaChatClientKey: EnvironmentKey {
    static let defaultValue: AbrovaChatClient? = nil
}

extension EnvironmentValues {
    /// Access the AbrovaChatClient from the environment
    public var abrovaChatClient: AbrovaChatClient? {
        get { self[AbrovaChatClientKey.self] }
        set { self[AbrovaChatClientKey.self] = newValue }
    }
}

/// Observable wrapper for AbrovaChatClient that manages lifecycle and connection state
@MainActor
public final class AbrovaChatClientWrapper: ObservableObject {
    /// The underlying AbrovaChatClient instance
    public let client: AbrovaChatClient

    /// Current connection state
    @Published public private(set) var isConnected = false

    /// Connection error if any
    @Published public private(set) var connectionError: Error?

    private var cancellables = Set<AnyCancellable>()

    public init(config: AbrovaChatConfig) {
        self.client = AbrovaChatClient(config: config)

        // Observe connection state
        client.onConnectionStateChange
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.isConnected = state == .connected
                if state == .error {
                    self?.connectionError = NSError(domain: "AbrovaChat", code: -1, userInfo: [NSLocalizedDescriptionKey: "Connection failed"])
                }
            }
            .store(in: &cancellables)
    }

    /// Connect to the AbrovaChat server
    public func connect() async throws {
        try await client.connect()
    }

    /// Disconnect from the server
    public func disconnect() {
        client.disconnect()
    }

    deinit {
        client.dispose()
    }
}

/// Provides AbrovaChatClient to the view hierarchy and manages its lifecycle
public struct AbrovaChatScope<Content: View>: View {
    @StateObject private var wrapper: AbrovaChatClientWrapper
    private let autoConnect: Bool
    private let onConnected: (() -> Void)?
    private let onConnectionError: ((Error) -> Void)?
    private let content: () -> Content

    /// Creates a AbrovaChatScope that provides a client to child views
    /// - Parameters:
    ///   - config: The AbrovaChat configuration
    ///   - autoConnect: Whether to connect automatically on appear
    ///   - onConnected: Callback when connection is established
    ///   - onConnectionError: Callback when connection fails
    ///   - content: The child views
    public init(
        config: AbrovaChatConfig,
        autoConnect: Bool = true,
        onConnected: (() -> Void)? = nil,
        onConnectionError: ((Error) -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        _wrapper = StateObject(wrappedValue: AbrovaChatClientWrapper(config: config))
        self.autoConnect = autoConnect
        self.onConnected = onConnected
        self.onConnectionError = onConnectionError
        self.content = content
    }

    public var body: some View {
        content()
            .environment(\.abrovaChatClient, wrapper.client)
            .environmentObject(wrapper)
            .task {
                if autoConnect {
                    do {
                        try await wrapper.connect()
                        onConnected?()
                    } catch {
                        onConnectionError?(error)
                    }
                }
            }
    }
}

/// Alternative provider for when you manage the client lifecycle externally
public struct AbrovaChatProvider<Content: View>: View {
    private let client: AbrovaChatClient
    private let content: () -> Content

    /// Creates a provider with an existing client
    /// - Parameters:
    ///   - client: The pre-configured AbrovaChatClient
    ///   - content: The child views
    public init(
        client: AbrovaChatClient,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.client = client
        self.content = content
    }

    public var body: some View {
        content()
            .environment(\.abrovaChatClient, client)
    }
}
