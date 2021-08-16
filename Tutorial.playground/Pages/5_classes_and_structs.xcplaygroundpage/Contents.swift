/*:
 [Previous](@previous)

 ## class, struct, enum

 */
/*:
 ### class

 `class`キーワードを使って、クラスを定義する事ができます。
  クラス内のプロパティ宣言はクラス内にあることを除けば変数の宣言と同じように書きます。関数も同様です。
 */

class Robot {
    var name: String

    // コンストラクタ
    init(name: String) {
        self.name = name
    }
    
    func attack() {
        print("\(name): beam!")
    }
}

// Robot型のオブジェクトを作る。
var robotA = Robot(name: "A")

// メソッド呼び出し
robotA.attack() // print 'A: beam!'

/*:
 ### struct
 structキーワードを使うと、構造体を定義できます。構造体はクラスと同じように複数の値やメソッドを持ちます。
 クラスと構造体の大きな違いは、構造体は代入された際にその値がコピーされ、クラスは参照が渡されるということです。
 */

struct Human {
    var name: String

    // ちなみに、構造体はプロパティを初期化するイニシャライザが暗黙的に定義されるので `init(name: String)` を定義する必要はありません。
    func attack() {
        print("\(name): punch!")
    }
}

// クラスと構造体の代入の挙動の違い

var humanA = Human(name: "A")
// 値がコピーされる
var humanB = humanA

humanB.name = "B"

print(humanA.name) // print A
print(humanB.name) // print B

// `robotB` は `robotA` への参照を持つ(オブジェクトのコピーは起きない)
var robotB = robotA

// `robotB` の値を書き換えてみる
robotB.name = "B"

// `robotB` は `robotA` を参照しているので、 `robotA` の値も書き換わっている
print(robotA.name) // print B
print(robotB.name) // print B


//: > Try2: 構造体であるHuman型のオブジェクトをvarではなくletで宣言したとき、どのような変化があるか確認してみましょう。また、その性質をクラスであるRobot型と比較してみましょう。

/*:
 ### enum
 enumキーワードを使うと列挙型を作ることができます。
 例えば方角を表す CompassPoint は以下のようにして定義することができる。
 */

enum CompassPoint {
    case north
    case south
    case east
    case west
}
// 定義した値は以下のようにして使用できる。

var direction = CompassPoint.north

// 変数や引数として使う際に型が推論できる状況では、型を省略し.始まりの値を指定することができる。

direction = .south


// Swift の Enumeration では列挙する値に関連する値を含ませることもできる。

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// Prints "QR code: ABCDEFGHIJKLMNOP."

//: [Next](@next)
