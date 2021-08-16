/*:
 [Previous](@previous)

 ## 配列と辞書

 ### Array

 `Array` は配列型です。例えば要素が `Int` の配列は `Array<Int>` もしくは `[Int]` と表記されます。以降は後者の表記を用います。
 */
let numbers1: [Int] = [1, 2, 3, 4, 5]

// 右辺の型が明らかなときは、型名を省略できる。
let numbers2 = [1, 2, 3, 4, 5]

// 要素にアクセスする
let a = numbers1[3]

//: > Try1: `numbers1` に対して、配列の範囲を超えて要素にアクセスしようとするとどうなるか、予想してから確認してみましょう。

// 空の配列も定義できる。
let numbers3: [Int] = []
//: > 空の配列で初期化するときは、必ず型名を書かなければエラーになります。(空の配列だと要素の型が推論できないため)
/*:
 ### Dictionary

 `Dictionary` は辞書型です。例えばキーが `String` で値が `Int` の配列は `Dictionary<String, Int>` もしくは `[String: Int]` と表記されます。以降は後者の表記を用います。
 */
let shoppingList: [String: Int] = [
    "apple": 1,
    "banana": 3,
    "potato": 5,
]

// 要素にアクセスする
let bananaCount = shoppingList["banana"]

//: > Try2: `shoppingList` に対して、存在しないキーの値を取得しようとしたときにどうなるか、予想してから確認してみましょう。
/*:
 ### `Array` や `Dictionary` は変数か定数かで振る舞いが異なる

 `Array` や `Dictionary` を `var` を使って変数として定義した場合は、あとから値を追加したり、値を書き換えたり、値を削除したりすることができます。一方、 `let` を使って定数として定義した場合は、そのような処理はできません。
 */
// ちなみに、配列や辞書は複数行に渡って記述することが出来ます。最後の要素にカンマがついていても大丈夫です。
var members: [String] = [
    "Takashi",
    "Ken",
    "Miho",
    "Kana",
]

members.append("Ryo")

var ageDict: [String: Int] = [
    "Takashi": 26,
    "Ken": 21,
    "Miho": 29,
    "Kana": 20,
]

ageDict["Ryo"] = 23

//: > Try3: `members` や `ageDict` を変数から定数に変えて、どうなるか確認しましょう。

//: [Next](@next)
