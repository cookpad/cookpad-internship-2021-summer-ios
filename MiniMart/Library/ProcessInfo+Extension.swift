import Foundation

extension ProcessInfo {
    var isRunningForPreview: Bool {
        environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
