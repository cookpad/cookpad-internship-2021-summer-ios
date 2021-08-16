//: [Previous](@previous)
/*:
 ## extension

 Swiftでは、既存の型やプロトコルにあとから実装を足すことができます。これをextensionと呼びます。局所的に何度も使われる処理をextensionとして定義したり、プロトコルにデフォルトの実装を定義したりできます。

 例えば、Int型に「10%の消費税を足した金額を返す」ようなプロパティをextensionによって追加してみましょう。
 */
extension Int {
    var withTax: Int {
        Int(Double(self) * 1.10)
    }
}

let penPrice = 100
let penPriceWithTax = penPrice.withTax
//: > ちなみに、これはあくまで例であって、実際のプロダクトにこのようなIntのextensionを生やすとコードレビューでツッコまれてしまうでしょう。余裕があって興味がある人は講師やTAに聞いてみましょう。

/*:
 また、extensionを使ってプロトコルにデフォルトの実装を定義することも出来ます。またAnimalの例を出しましょう。
 */
protocol Animal {
    var name: String { get set }
    func bark()
}
/*:
 前のセクションで学習した通り、このAnimalプロトコルを実装したい型は、Animalプロトコルに含まれるプロパティやメソッドをすべて実装しなければいけませんね。
 しかし、extensionを使ってAnimalプロトコルにデフォルト実装を定義すると、そのメソッドやプロパティを実装しなかったとしても、それを利用してコンパイルを通す事ができます。
 */
extension Animal {
    func bark() {
        print("…。")
    }
}

struct Dog: Animal {
    var name: String

    // 従来どおり、自前でbarkメソッドを実装してもよい。
    func bark() {
        print("ワン")
    }
}

struct Cat: Animal {
    var name: String

    // barkメソッドを実装しないこともできる。
}

let dog = Dog(name: "ポチ")
dog.bark() // 画面右側のインスペクタではなく、画面下のコンソール出力を見ましょう

let cat = Cat(name: "たま")
cat.bark() // 画面右側のインスペクタではなく、画面下のコンソール出力を見ましょう

/*:
 このように、 `bark` メソッドを独自に実装している `Dog` 型は、その `bark` メソッドが使われ、 `bark` メソッドを持たない `Cat` 型は `Animal` プロトコルにextensionで追加されたデフォルトの `bark` を使っていることが分かると思います。
 */

//: > Try1: Animal型のextensionからbarkメソッドのデフォルト実装を削除して、Cat型にエラーが出るのを確認しましょう。
//: [Next](@next)
