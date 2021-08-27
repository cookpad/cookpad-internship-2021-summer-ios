import SwiftUI

struct ProductDetailPageView: View {
    @EnvironmentObject var cartState: CartState
    var product: FetchProductsQuery.Data.Product
    var body: some View {
        // 端末の高さに収まらない可能性があるので、ScrollViewを使います
        ScrollView {
            // 要素を縦に積んでいくので、VStackを使います
            VStack(
                // 各要素を左詰めにしたいのでleading
                alignment: .leading,
                spacing: 24
            ) {
                RemoteImage(urlString: product.imageUrl)
                    .frame(maxWidth: .infinity) // 画面幅いっぱいに広げる
                    .aspectRatio(1.0, contentMode: .fill) // aspectRatioを使って、1:1の大きさになるようにする
                VStack(alignment: .leading, spacing: 24) {
                    Text(product.name)
                        .font(.title2)
                    // `円`よりも値段の数字のフォントを大きくするため
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(product.price)")
                            .font(.title2)
                        Text("円")
                            .font(.footnote)
                    }
                    Text(product.summary)
                }
                .padding(8) // 上下左右に8pxの隙間をあける
                Spacer() // ボタンを画面下部に固定したいのでSpacerで空けられるだけ空ける
                Button(action: { cartState.add(product: product) }) {
                    // 角丸ボタン。幅いっぱいに広げて左右を8pxあける。高さは固定値にする。
                    Text("カートに追加")
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(8)
                        .padding(8)
                }
            }
        }
        // タイトルをView内に表示したので、navigationTitleから削除。画像を大きく表示するため、navigationBarの大きさを小さくする
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                // CartButtonはリスト画面と使い回すため、カスタムビュー化
                CartButton()
            }
        }
        .padding(.bottom, 24) // 画面下にべったりくっつくと押しづらいので24pxの隙間をあける
    }
}

struct ProductDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailPageView(
                product: FetchProductsQuery.Data.Product(
                    id: UUID().uuidString,
                    name: "商品 \(1)",
                    price: 100,
                    summary: "おいしい食材 \(1)",
                    imageUrl: "https://image.cookpad-mart.com/dummy/1"
                )
            )
        }
        .environmentObject(CartState())
    }
}
