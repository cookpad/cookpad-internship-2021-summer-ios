/*:
 [Previous](@previous)

 ## 関数とクロージャ

 ### 関数の定義

 Swiftでは `func` というキーワードを使って関数を定義します。

 例として、名前(String)と年齢(Int)を引数とし、メッセージ(String)を返り値とする `createMessage` という名前の関数を定義します。
 */
func createMessage(firstName: String, age: Int) -> String {
    return "My name is \(firstName). I'm \(age) years old."
}
//: > 関数の中身が1行だけのとき、 `return` キーワードを省略することもできます。
/*:
 ### 関数の呼び出し

 定義した関数を呼び出すには、関数の名前に続けて括弧で括った引数を記述します。引数はラベル(引数名)と渡す値を記述します。引数は、定義された順番に渡す必要があります。
 */
// 右辺が関数のときも、型推論が利用できる。
let message = createMessage(firstName: "Emily", age: 25)
/*:
 ### 引数や返り値のない関数

 引数がない関数や、返り値がない関数は以下のように定義します。
 */
// 引数がない関数
// 引数のリストを空の括弧にする。
func answer() -> Int {
    42 // 1行の関数なので、 `return` を省略できる
}

// 返り値がない関数
// `-> 返り値の型` を省略する。
func printMessage(firstName: String, age: Int) {
    print("My name is \(firstName). I'm \(age) years old.")
}

/*:
 ### Swiftにおける関数
 
 swiftでは関数は第一級オブジェクトです。
 関数を戻り値として返したり、変数に格納したり、別の関数を引数として受け取ることができます。
 
 この例では関数を引数として受け取っています。
 */

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Prints true


/*:
  ### クロージャ
 コードを中括弧で囲むと、名前のないクロージャを作ることができます。
 `hasAnyMatches`にクロージャを渡してみます。
 */

// 中括弧の中を`in`で区切る
hasAnyMatches(list: numbers, condition: { (value: Int) -> Bool in
    return value < 15
})
// Prints true

// Trailing closureという構文があり、末尾の引数の型がクロージャだった場合は無名関数の記述を関数呼び出しのカッコの外に出せます。
// クロージャの引数の型や戻り値の型は推論が可能な場合は省略ができます
hasAnyMatches(list: numbers) { value in
    return value < 15
}
// Prints true

// クロージャが受け取る引数は変数を宣言する代わりに数字で参照することもできる
hasAnyMatches(list: numbers) { $0 < 15 }

// クロージャは変数に持つことができる
let compare: (Int) -> Bool = { value in
    return value < 15
}

//: [Next](@next)
