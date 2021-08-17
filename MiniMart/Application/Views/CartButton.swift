import SwiftUI

struct CartButton: View {
    @State var isCartViewPresented: Bool = false
    @EnvironmentObject var cartState: CartState

    var body: some View {
        Button(action: { self.isCartViewPresented = true }) {
            VStack {
                Image(systemName: "folder")
                // totalProductCountsはカートに入っている商品数の和を返す
                Text("\(cartState.totalProductCounts)")
            }
        }
        .sheet(isPresented: $isCartViewPresented) {
            NavigationView {
                // CartPageViewで注文完了後に画面を閉じるため
//                CartPageView(isCartViewPresented: $isCartViewPresented)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
            .environmentObject(CartState())
    }
}
