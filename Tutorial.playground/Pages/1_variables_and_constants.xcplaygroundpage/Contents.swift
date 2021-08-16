/*:
 [Previous](@previous)
 ## 変数・定数

 Swiftには再代入可能な "変数(variable)" と、再代入ができない "定数(constant)" があります。

 ### 変数

 変数は `var` というキーワードを使って宣言します。
 */
// `var 変数名: 型名 = 初期値`
var number1: Int = 42
var text1: String = "Hello!"
// 変数は値を再代入することができます。
number1 = 100
text1 = "Bye!"
/*:
 ### 定数

 定数は `let` というキーワードを使って宣言します。定数なので値を変更しようとするとコンパイルエラーになります。
 */
// `let 変数名: 型名 = 初期値`
let number2: Int = 42
let text2: String = "Hello~"
//: > Try1: 以下の行のコメントアウトを解除して、定数を再代入しようとするとエラーになることを確認しましょう。
//number2 = 100
// text2 = "Bye~"
/*:
 ### 型

 変数には型があり、整数を表現するInt型や文字列を表現するString型など様々な型がある。Swiftでは型推論できる場合は型を明示することを省略できる。
 */
// 型を明示
let number: Int = 100

// リテラルからの推論
let number3 = 123 // Int型に推論される
let number4 = 36.5 // Double型に推論される
let text3 = "Cookpad" // String型に推論される

// 右辺の変数からの推論
let number5 = number1 // number1はInt型であるので、number5はInt型に推論される
let text4 = text1 // text1はString型であるので、text4はString型に推論される
/*:
 ただし、右辺が複雑な式である場合など、型推論ができずコンパイルエラーになったり、コンパイルにかかる時間が長くなったりすることがあります。そういった場合は、開発者が型名を明示してあげることで、コンパイル時間を改善することができます。
 */
/*:
 ### 文字列への埋め込み

 Swiftでは文字リテラルに変数を埋め込みたいとき、以下のように書きます。
 */
let firstName = "Bob"
let age = 21
let message = "My name is \(firstName). I'm \(age) years old."

//: > 説明の便宜上、以降のセクションでは特に断りがない限り、変数と定数をまとめて「変数」と表記します。


//: [Next](@next)
