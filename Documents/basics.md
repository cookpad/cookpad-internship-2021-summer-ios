# Swift

## 変数

## 関数定義

## Optional

## Generics

## Struct/Class

## Closure

## おわりに

# SwiftUI

## 構文

## 基本的なView

## 基本的なProperty Wrappers

## Case Study

## おわりに

# Swift for SwiftUI

Swiftを少し書いたことがある人はSwiftUIのbodyの実装を見ると少しギョッとすると思います。
- `some View`のってなに？
- `return`を書かなくてもいいの？
- `@State`ってなに
- `VStack { Text() Text() }` の意味がわからない。。
- でもViewの定義として見やすいんだよな。。
- でもSwiftとしてValidなのか、トランスパイルしとるんと違うか？
それもそのはずで、これらはSwiftUIと同時にリリースされたSwift 5.1の新しい仕様だからです。
- `some View`は`Opaque Return Type`という仕様です。bodyの戻り値は`Text`だったり`Image`だったりします。どれも`View`を適用したstructなので`View`でも良さそうですが、これは実行時のパフォーマンスに難があるのです。
その問題を解決するために、`Opaque Result Type`という仕様が足されました。宣言の戻り値には`some View`のように抽象的な型をかけるが、コンパイル時には具体的な型として解決されます。
詳しいことはこの記事を読んでください。
- `return`を書かなくていいのは `implicit returns`という仕様です。
関数の中に1つの式しかなかった場合、`return`を省略してもその式の評価結果が戻り値に扱われます。
`func num() -> Int { return 1 }`と`func num() -> { 1 }` のように書けるのです。
- `@State`は`property wrapper`という仕様です。
  - 従来から`@`付きで
- `VStack { Text() Text() }` を可能にしているのは、 `Result builders`という仕様です
VStackのinitの宣言を見てみましょう。
```
init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)
```
として定義されています。
最後の引数が`Content`を返すclosureになっていますね。

`VStack {}` と書けているのは単にtrailing closureの仕様であることがわかります。

もう1度VStackの構文を見てみましょう

```
VStack {
    Text("")
    Text("")
}
```

VStackが受け取るのは1つの`Content`を返すclosureです。しかし実装には`Text`が２つ並んでいます。
これはどう解釈されているのでしょうか。
これを解決しているのが、`@ViewBuilder`です。
@ViewBuilderとマークされたクロージャはコンパイル時に別の形に変換されます。
今回の例だと以下の形になって解釈されます。
```
VStack {
    ViewBuilder.buildBlock(
        Text(""),
        Text("")
    )
}
```
ViewBuilderのbuildBlockの定義を見て見ましょう。
```swift
extension ViewBuilder {
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0 : View, C1 : View
}
```
2つのViewを受け取って、TupleViewを返す`buildBlock`の関数が宣言されています。
`VStack { }`
というのは、`Text(), Text()`は`TupleView<(Text, Text)>`という1つのViewに変換されているのですね。
ちなみに
同様の関数が引数の数ごとに宣言されており、無引数のものから10個受け取るものまで宣言されてますね。
VStackにフラットに記述できるView要素が10個までなのはこのためです。