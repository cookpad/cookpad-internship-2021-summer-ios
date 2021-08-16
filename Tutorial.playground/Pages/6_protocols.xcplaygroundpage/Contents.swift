import Foundation
/*:
 [Previous](@previous)

 ## プロトコル

 Swiftでは、プロトコルを使って他の型に特定のメソッドやプロパティなどの実装を強制することができます。
 例として、 "名前" というプロパティと、 "鳴く" というメソッドを含む `Animal` というプロトコルを定義してみます。
 */
protocol Animal {
    // プロトコルを実装する型は、プロトコルに含まれるメソッドやプロパティをすべて実装しないとコンパイルエラーになる。

    // 読み(get)と書き(set)が両方できる `name` という `String` 型のプロパティがある　という意味
    var name: String { get set }

    func bark()
}
/*:
 そして、この `Animal` プロトコルに準拠した、`Dog` と `Cat` という2つの型を実装してみましょう。
 */
// 型名に続けてプロトコルの名前を書くことで、そのプロトコルを実装するということを表明できる
struct Dog: Animal {
    var name: String

    func bark() {
        print("ワン")
    }
}

struct Cat: Animal {
    var name: String

    func bark() {
        print("にゃー")
    }
}

// Animal型の変数を宣言します
let myPet: Animal

// Dog型はAnimalプロトコルを実装しているので、Animal型の変数に代入できます。
myPet = Dog(name: "ポチ")

//: > Try1: `Dog` 型から、 `name` プロパティと `bark` メソッドを削除して、コンパイルエラーになることを確認しましょう。

//: [Next](@next)


var maxIndex: Int = 0
var boobieIndex: Int = 0
var scores: [Int] = [1, 123, 12345, 12, 1234, 123456]

let result = scores.enumerated().reduce((maxIndex, boobieIndex)) { pair, keyValue in
    let score = keyValue.element
    let index = keyValue.offset
    let (maxIndex, _) = pair
    let max = scores[maxIndex]
    if score > max {
        return (index, maxIndex)
    } else {
        return pair
    }
}

print(result.1 + 1)

