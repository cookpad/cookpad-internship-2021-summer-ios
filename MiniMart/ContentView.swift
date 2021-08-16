import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}


struct MyView: View {
    @State var isLoading: Bool = false
    @State var jankenResult: String?
    @State var error: String?
    var body: some View {
        VStack {
            if isLoading {
                Text("読込中")
            } else {
                if let error = error {
                    Text("問題が発生しました: \(error))")
                } else if let jankenResult = jankenResult {
                    switch jankenResult {
                        case "win":
                            Text("勝ち")
                        case "lose":
                            Text("負け")
                        case "even":
                            Text("あいこ")
                        default:
                            Text("不明")
                    }
                } else {
                    Text("不明")
                }
            }
            Button(action: { /* JankenProvider.execute { self.jankenResult = $0 } */ }) {
                Text("じゃんけんをする")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
