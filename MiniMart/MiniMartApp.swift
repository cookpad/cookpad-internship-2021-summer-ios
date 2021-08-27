import SwiftUI

@main
struct MiniMartApp: App {
    @StateObject var cartState = CartState()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProductListPageView()
            }
            .environmentObject(cartState)
        }
    }
}
