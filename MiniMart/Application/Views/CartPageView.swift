import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartState: CartState
    @State var isOrderConfirmationAlertPresented: Bool = false
    @Binding var isCartViewPresented: Bool

    var body: some View {
        // ボタンを画面最下部に出すため、VStackでListとそれ以外の要素を縦に積む
        VStack {
            List(cartState.cartItems, id: \.product.id) { item in
                HStack(alignment: .top) {
                    RemoteImage(urlString: item.product.imageUrl)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.product.name)
                        Text("\(item.product.price)円")
                        Text("\(item.quantity)個")
                    }
                    .padding(.vertical, 8)
                }
            }
            VStack(spacing: 16) {
                Divider()
                // 合計金額の計算はCartStateのtotalPriceというプロパティで引けるようにする
                Text("合計: \(cartState.totalPrice)円")
                    .bold()
                    // 右寄せにする
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Divider()
                // 注文ボタンを押したらアラートを表示
                // 商品詳細と同じく
                Button(action: { self.isOrderConfirmationAlertPresented = true }) {
                    Text("注文する")
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
            }
            .padding(8)
        }
        // alertの宣言
        .alert(isPresented: $isOrderConfirmationAlertPresented) {
            Alert(
                title: Text("注文が完了しました"),
                message: nil,
                dismissButton: Alert.Button.default(Text("OK")) {
                    isCartViewPresented = false
                    cartState.clear()
                }
            )
        }
        .navigationTitle(Text("カート"))
    }
}

struct CartPageView_Previews: PreviewProvider {
    @State static var isCartViewPresented: Bool = false
    static var previews: some View {
        NavigationView {
            CartPageView(isCartViewPresented: $isCartViewPresented)
        }
    }
}
