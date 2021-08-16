import SwiftUI

struct CartPageView: View {
    var body: some View {
        Text("Hello, World!")
            .navigationTitle("カート")
    }
}

struct CartPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartPageView()
        }
    }
}
