import SwiftUI

// ツールバーに表示するボタン。複数画面で複雑な処理を書くのでView化する
struct CartButton: View {
    @State var isCartViewPresented: Bool = false
    // カートへの追加数を表示するため、CartStateを参照
    @EnvironmentObject var cartState: CartState

    var body: some View {
        Button(action: { self.isCartViewPresented = true }) {
            VStack {
                Image(systemName: "folder")
                // テキストで商品数を表示
                // totalProductCountsはカートに入っている商品数の和を返す
                Text("\(cartState.totalProductCounts)")
            }
        }
        .sheet(isPresented: $isCartViewPresented) {
            NavigationView {
                CartPageView()
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
