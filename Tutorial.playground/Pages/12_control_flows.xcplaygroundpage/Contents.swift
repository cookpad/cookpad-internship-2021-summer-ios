/*:
 [Previous](@previous)

 ## 制御構文
 https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html

 ### if

 */

let count = 10
if count < 10 {
    print("\(count)")
}

let optionalInt: Int? = 10
if optionalInt != nil {
    print("optionalCount is not nil")
}

/*:
 ### for
 */

let numbers = [1, 2, 3, 4, 5]
for i in numbers {
    print(i)
}

let dictionary = ["a": "A"]

for (key, value) in dictionary {
    print("\(key) => \(value)")
}

// for (i = 0; i < 10; i++) のような伝統的なfor文の代替
for i in 0..<10 {
    print(i)
}

/*:
 ### switch
 
 switchは整数以外のデータでも受け入れることができます。caseにも様々な比較演算をサポートしています。
 詳しくは https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html を見てみましょう
 
 */


switch numbers[0] {
case 0:
    print("zero")
case 1:
    print("one")
default:
    print("unknown")
}


let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."

//: [Next](@next)
