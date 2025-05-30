# バリデーションとは
有効なデータをデータベースのみをデータベースに保存する仕組み。例えば、機能しないアドレスや住所がデータに混入しないようにすることができる。

> 有効なデータだけをデータベースに保存し、無効なデータがデータベースに紛れ込まないようにすることです。 
> すべてのユーザーが有効なメールアドレスと郵送先住所を提供していることを保証することがアプリケーションにとって重要な場合があります。

# 実装方針
以下の通り、validatesメソッドの後に対象カラムを入力し、,(カンマ)を介してどのメソッドを使用するかどうか設定する。

```
validates :対象カラム, バリデーション種類: true
```

# 実装方法
それぞれのメソッドの特徴を以下に示す。
バリデーションの種類は大まかに分けて、対象カラムに値が存在するか否か、存在するならばカラム単体に対しての条件に当てはまるかどうか、または、他と比較した時の条件にに適合するかどうかを検証する。

- presenceとabsenseは反対の機能を持つメソッド。

## 存在
特定のカラムに値が存在するかどうかを検証するメソッド。

### presence
対象カラムが空の時にエラーを返す。

### absence
対象とするカラムが空でない時にエラーを返す。

## 検証
### numericality
指定したカラムが数値出ない時にエラーを返す。

### length
指定したカラムが一定の長さ以上の時にエラーを返す。

## 比較
### confirmation
指定した確認カラムと比較して一致するかどうかを検証する。

### uniqueness
対象カラムが一意(他に同じものが存在しない)出ない時エラーを返す

# 実際の実装
まず、本実装に入る前に試行として簡易なバリデーションを実装した。
具体には、投稿内容の文字列と展示会名についてバリデーションを実装した。
以下に実装したコードを示す。

<details>

<summary>reviews.rb</summary>

```
  # validations
  validates :exhibition, presence: true
  validates :body, length: { in: 10..200 }
```

</details>

# 結果
一部のモデルにバリデーションを実装して、エラーメッセージが表示されることを確認した。
これによりバリデーションの動作確認は完了した。

# 今後
- 現在のモデル、カラムに対して適切なバリデーションを設計・実装する。

# 参考資料
- [Active Record(Railsのモデル) バリデーションまとめ | 酒と涙とRubyとRailsと](https://morizyun.github.io/ruby/active-record-validation.html)
- [Railsバリデーションまとめ #ActiveRecord - Qiita](https://qiita.com/h1kita/items/772b81a1cc066e67930e)
- [Active Record バリデーション - Railsガイド](https://railsguides.jp/active_record_validations.html#%E3%83%90%E3%83%AA%E3%83%87%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B-errors)

