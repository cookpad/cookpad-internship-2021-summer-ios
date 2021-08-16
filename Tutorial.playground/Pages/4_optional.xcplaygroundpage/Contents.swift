/*:
 [Previous](@previous)

 ## Optional

 Swiftでは通常、変数に対してnilを代入することができません。
 それに対してnilを代入できるOptionalという型が用意されています。
 Optionalは値が存在しない可能性がある状況で使用する型です。
 例えば、nilを代入できるInt型として`Int?`型があります。(正確にはOptionalにラップされているInt型`Optional<Int>`)

 > Try1: `number1` に `nil` を代入するように書き換えて、エラーになることを確認しましょう

 */
var number1: Int = 1
number1 = 100
// number1 = nil => nil cannot be assigned to type 'Int'

var number2: Int? = nil
number2 = 200
number2 = nil // => nil

/*:
 ### Optional Binding

 Optional型の変数はそのままで扱うことができず、非Optionalな値を取り出す必要があります。
 Optional Binding構文は、Optional型の変数が値を持っているかどうかを調べ、値が存在した場合はその値を変数として利用できます。

 */
 
func isOdd(_ value: Int) -> Bool {
    value / 2 != 0
}
let optionalNumber: Int? = 10
// isOdd(optionalNumber) // => Value of optional type 'Int?' must be unwrapped to a value type of 'Int'

if let number = optionalNumber {
    print(isOdd(number) ? "odd" : "even")
} else {
    print("number is nil")
}

/*:
 guardを使って早期returnをする構文もあります。
*/

func isEven(_ value: Int?) -> Bool? {
    guard let value = value else {
        return nil
    }
    return value / 2 == 0
}

/*:
 ### Nil-Coalescing Operator
 Swiftには `??` というオペレータがあります。これは Nil-Coalescing Operator と呼ばれ、「Optionalな変数が値を持たなかった場合、デフォルトの値を使う」といった挙動を実現できます。
 */
let fullName = "Masaru Ichikawa"
let nickname: String? = "Masaichi-san"

// `nickname` が値を持っていたらそれを使い、なかったら `fullName` を使う。
let message3 = "Hi, \(nickname ?? fullName)!"

/*:
 ### Optional Chaining
 
 Optionalの値を扱う場合、メソッド、プロパティの前に`?`を書くことができます。? の前の値が nil の場合、? の後のすべては無視され、式全体の値は nil になります。そうでない場合は、オプションの値がアンラップされ、? の後のすべてがアンラップされた値に作用します。どちらの場合も、式全体の値はオプションの値です。
 これをOptional Chainingと呼びます
 */
var optionalCharacters: [String]? = ["a", "b", "c"]

// 配列の先頭の値を大文字にする
// Optional Chainはnilになる可能性があるので、必ずOptionalになる
let uppercased: String? = optionalCharacters?.first?.uppercased()

print(uppercased ?? "characters is nil")


/*:
 
### Implicity Unwrapped Optional

 `?`でなく、`!`を変数につけることで宣言する。IUO型には`nil`を代入可能だが、明示的なアンラップすることなく扱えるが、nilが入っていた場合クラッシュします

*/

var iuoNumber: Int! = nil
// print(iuoNumber) => fatal error

/*:
 [Next Page](@next)
 */
