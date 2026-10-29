import Foundation

/// Identity this SDK reports to the API with every request
/// (`X-Abrova-SDK: ios/<version>`).
public enum AbrovaChatSDKInfo {
    /// Name of this SDK.
    public static let name = "ios"

    /// Version of this SDK. Must match `AbrovaChat.podspec`; a unit test
    /// fails when they drift.
    public static let version = "0.2.0"

    /// Header that carries the SDK identity.
    static let headerName = "X-Abrova-SDK"

    /// Its value: `ios/<version>`.
    static let headerValue = "\(name)/\(version)"
}
