import SwiftUI
import AbrovaChat
import AbrovaChatUI
import AbrovaPush

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        AbrovaPush.shared.setAPNsToken(deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("[AbrovaPush] Failed to register for APNs: \(error)")
    }
}

/// Main entry point for the AbrovaChat E-commerce example app.
@main
public struct AbrovaChatEcommerceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    public init() {}

    public var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var currentUser: DemoUser?
    @State private var abrovaChatClient: AbrovaChatClient?
    @State private var selectedOrder: Order?
    @State private var navigationPath = NavigationPath()

    var body: some View {
        Group {
            if let user = currentUser, let client = abrovaChatClient {
                NavigationStack(path: $navigationPath) {
                    OrdersScreen(
                        currentUser: user,
                        client: client,
                        onOrderTap: { order in
                            selectedOrder = order
                            navigationPath.append(order.id)
                        },
                        onLogout: logout
                    )
                    .navigationDestination(for: String.self) { orderId in
                        if let order = MockOrders.getById(orderId) {
                            OrderChatScreen(
                                order: order,
                                currentUser: user,
                                client: client,
                                onBack: {
                                    navigationPath.removeLast()
                                }
                            )
                        }
                    }
                }
            } else {
                LoginScreen(onLogin: login)
            }
        }
    }

    private func login(user: DemoUser) {
        currentUser = user
        let config = AbrovaChatConfig(
            apiKey: ExampleConfig.apiKey,
            userId: user.id,
            userInfo: ["displayName": user.name]
        )
        print("[AbrovaChat] Creating client for user: \(user.id) (\(user.name))")
        let client = AbrovaChatClient(config: config)
        abrovaChatClient = client
        let pushConfig = AbrovaPushConfig(apiKey: ExampleConfig.apiKey, showNotificationInForeground: true)
        AbrovaPush.shared.initialize(config: pushConfig)
        AbrovaPush.shared.register(userId: user.id, metadata: ["displayName": user.name, "role": user.role.rawValue])
        Task {
            do {
                print("[AbrovaChat] Connecting...")
                try await client.connect()
                print("[AbrovaChat] Connected successfully!")
            } catch {
                print("[AbrovaChat] Connection failed: \(error)")
            }
        }
    }

    private func logout() {
        AbrovaPush.shared.unregister()
        abrovaChatClient?.disconnect()
        abrovaChatClient = nil
        currentUser = nil
        selectedOrder = nil
        navigationPath = NavigationPath()
    }
}

/// Settings for running this example.
enum ExampleConfig {
    /// Your project's public key (`ab_live_...`) from Abrova Console, used by
    /// both Abrova Chat and Abrova Push. Replace the placeholder before
    /// running, and do not commit your real key.
    static let apiKey = "ab_live_your_api_key"
}
