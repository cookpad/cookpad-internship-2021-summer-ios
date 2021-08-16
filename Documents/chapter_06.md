# ハンズオンで紹介しなかった知っておいてほしいこと

## 分岐

if文やswitch文を書くことができます

```swift

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



```

## ForEach

[ForEach](https://developer.apple.com/documentation/swiftui/foreach)

ForEachはArrayを表示するViewです。
以下のコードは`ForEach`に渡したテキストの配列を縦方向に表示します
idに渡している`\.self`は配列の要素自身を表すKeyPathです。

```swift

VStack {
    ForEach(["a", "b", "c"], id: \.self) { text in 
        Text(text)
    }
}


```

## ScrollView

[ScrollView](https://developer.apple.com/documentation/swiftui/scrollview)

ScrollViewは画面に収まり切らないコンテンツを表示するために利用します。
以下のコードは0から999までの数字を1行ずつ表示します。
当然画面に収まり切りませんが、ScrollViewで括ることで収まりきらない分をスクロールすることで表示できるようになります。

```swift

ScrollView {
    VStack {
        ForEach(0..<1000, id: \.self) { num in 
            Text("\(num)")
        }
    }
}

```

## LazyVStack, LazyHStack

- [LazyVStack](https://developer.apple.com/documentation/swiftui/lazyvstack)
- [LazyHStack](https://developer.apple.com/documentation/swiftui/lazyhstack)

画面範囲内にあるViewだけを描画するstackです。

```swift
ScrollView {
    LazyVStack(alignment: .leading) {
        ForEach(1...100, id: \.self) { num in
            Text("Row \(num)")
        }
    }
}
```

これを単に`VStack`で積むと画面内外関係なく描画をするため描画内容や数よっては非常に重い処理になります。
LazyVStackにすると、画面をスクロールし表示されるViewだけが描画されるため、最低限の描画処理で済むようになります。

ちなみにListはそれ単体でスクロールと画面内のみレンダリングする機能を備えていますが、`List`特有のレイアウトへの制約があり（勝手にマージンがつく等）、扱いづらいことがよくあります。
ScrollView + LazyVStack + ForEachを使うパターンは記述は煩雑ではあるが、レイアウトの自由度が高いことが利点です。

## 補足

ここまでで紹介できたのはSwiftUIのほんの一部です。
ユーザー入力を扱う`Form`や`UIKit`と連携する仕組み、アニメーションや図形の描画などなど、豊富な仕組みがあります。
他にどういったものがあるのか、Viewや状態管理については、[SwiftUI](https://developer.apple.com/documentation/swiftui/)のページの`User Interface`と`Data and Evnents`を参照するのが良いでしょう。

`ViewModifier`は[Xcodeのインスペクタエリア](images/ch7/modifiers.png)か[こちらのページ](https://developer.apple.com/documentation/swiftui/text-view-modifiers)から探すのが良いでしょう。

---

[Chapter7へ進む](chapter_07.md)
