import Foundation

struct CartItem {
    var product: FetchProductsQuery.Data.Product
    var quantity: Int
    
    var price: Int {
        product.price * quantity
    }
}
