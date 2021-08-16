import SwiftUI

@main
struct MiniMartApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProductListPageView()
            }
        }
    }
}
