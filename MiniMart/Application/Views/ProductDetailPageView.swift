import SwiftUI

struct ProductDetailPageView: View {
    @State var isCartViewPresented: Bool = false
    @EnvironmentObject var cartState: CartState
    var product: FetchProductsQuery.Data.Product
    var body: some View {
        ScrollView {
            RemoteImage(urlString: product.imageUrl)
                .frame(width: 300, height: 300)
            VStack(alignment: .leading){
                Text("\(product.name)")
                Text("\(product.price)円")
                Text("\(product.summary)")
                Button(action: {
                    cartState.add(product: product)
                }, label: {
                    Text("カートに追加")
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(5.0)
                })
            }
        }
        .navigationTitle("Minimart")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                CartButton()
            }
        }
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
