# 概要
reviewモデルにvalidationを実装する。

# 流れ
- カラムを列挙する
- 自身で案を作成
- chatGPTに投げる

# 

| カラム名           | バリデーション内容               |
|--------------------|----------------------------------|
| id                 | -                                |
| exhibition         | 必ず入力、文字数制限             |
| created_at         | -                                |
| updated_at         | -                                |
| user_id            | -                                |
| museum_id          | -                                |
| rating01           | -                                |
| body               | 必ず入力、文字数制限             |
| exhibition_rate    | 必ず入力、数字のみ許容、上限設定 |
| museum_design_rate | 必ず入力、数字のみ許容、上限設定 |
| access_rate        | 必ず入力、数字のみ許容、上限設定 |
| museum_shop_rate   | 必ず入力、数字のみ許容、上限設定 |

# 実装方法

| 内容         | 実装方法       |
|--------------|----------------|
| 必ず入力     | presence: true |
| 文字数制限   | length         |
| 数字のみ許容 | numericality   |
| 上限設定     | inclusion      |

## 具体の使用方法
### length         
属性の値の長さを検証する。

| オプション名     | 内容                 |
|------------------|----------------------|
| {maximum: 数字}  | 最大値を決定         |
| {minimum: 数字}  | 最小値を決定         |
| {in: 数字..数字} | 最大値、最小値を決定 |

### numericality  
属性に数値のみが使われていることをバリデーションします。

### inclusion     

| オプション名                 | 内容                                     |
|------------------------------|------------------------------------------|
| { in: %w(small medium large) | 　指定した値に入力値が一致することを検証 |

### with_options
with_optionsで特定のオプションを複数のカラムに適用できる。
書き方としては、オプションのブロックを作成し、その中にモデル名をvalidatesメソッドを用いて追記する。

```
with_options オプション名: 値 do
  validates :モデル名
end
```

```
with_options presence: true do
  validates :user
  validates :item
  validates :price
  validates :email
end
```
# 参考資料
- [Active Record バリデーション - Railsガイド](https://railsguides.jp/active_record_validations.html)
- [with_optionsを使って、同じバリデーションを一括りにしちゃえ！ #Ruby - Qiita](https://qiita.com/TerToEer_sho/items/2b2c36b615d92b7dd021)
