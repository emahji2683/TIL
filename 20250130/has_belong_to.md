  has_and_belongs_to_many関連付けとは
中間テーブル(join table)のモデルを作成することなく、多対多のリレーションを作成できる。

> has_and_belongs_to_many関連付けは、他方のモデルと「多対多」のリレーションシップを作成しますが、through:を指定した場合と異なり、第3のモデル（joinモデル）が介在しません。この関連付けは、それを宣言しているモデルの各インスタンスが、他方のモデルのインスタンスを0個以上参照することを示します

# 実装の流れ
- タグモデルの作成
- リレーションの設定
- 中間テーブルの作成(has_and_belongs_to_manyを使用する場合、モデルの作成は不要)
- プリセットデータの作成
- フォームの作成

# 実装方法
## タグモデルの作成

```
docker compose exec app rails g model Tag title:string
```

## リレーションの設定
多対多の関係性のあるテーブル同士にリレーションを記述する。

```
class Review < ApplicationRecord
  has_and_belongs_to_many :tags
end

class Tag < ApplicationRecord
  has_and_belongs_to_many :reviews
end
```

## 中間テーブルの作成(has_and_belongs_to_manyを使用する場合、モデルの作成は不要)
JoinTable(中間テーブル)を作成(create)するマイグレーションファイルを作成する。
migrationファイル名の書き順は行為テーブル名1テーブル名2。

```
rais g migration 行為テーブル名1テーブル名2※ テーブル名1 テーブル名2
```
※キャメルケースで記述する。
※migrationの場合、テーブル名は単数系で記述する

```
rails g migration CreateJoinTableReviewsTags review tag
```

## プリセットデータの作成

```
Tag.create([
  { name: "おすすめ" },
  { name: "雰囲気がいい" },
  { name: "静か" },
  { name: "展示が豊富" },
  { name: "写真撮影OK" }
])
```

## フォームの作成

```
<%= form_with(model: @review, local: true) do |f| %>
  <p>
    <%= f.label :content, "レビュー内容" %><br>
    <%= f.text_area :content %>
  </p>

  <p>タグを選択:</p>
  <% @tags.each do |tag| %>
    <label>
      <%= check_box_tag "review[tag_ids][]", tag.id, @review.tags.include?(tag) %>
      <%= tag.name %>
    </label>
  <% end %>

  <p>
    <%= f.submit "レビューを投稿" %>
  </p>
<% end %>
```
# わからない箇所

- 取得したタグの一覧をeachで個別に表示する。
- review[tag_ids][]: reviewモデルに対して、tag_ids(タグのID一覧)を配列として渡す。指定した配列([])の中には、checkされた(true)ボックスtag.idが一つ一つ渡される。

例：tag_ids: [1, 2, 3]

```
  <% @tags.each do |tag| %>
    <label>
      <%= check_box_tag "review[tag_ids][]", tag.id, @review.tags.include?(tag) %>
      <%= tag.name %>
    </label>
  <% end %>
```


## チェックボックス

name: 変数
value: 値
{ name:値 }の形式送信される。


```
    <input
      type="checkbox"
      id="subscribeNews"
      name="subscribe"
      value="newsletter" />
```

## check_box_tag
ヘルパーメソッド。
以下の通り、定義された変数：値がチェックされている場合、送信される。

```
check_box_tag "name名", "value名", チェックの真偽値
```

#　結果
- tag機能を実装できた

# 今後
- badge形式で表示できるようにする
- 表示しているtagの内容を改善する

# 参考資料
- [Rails タグ付け機能](https://zenn.dev/goldsaya/articles/625bdf837c1c68)
- [[Rails] 情報編集画面に遷移した際、編集前の情報が全てフォームに入力された状態にする #初学者向け - Qiita](https://qiita.com/yait/items/080854fa009969154f7e)
- [HTMLでチェックボックスを作成する方法【初心者向け】 | TechAcademyマガジン](https://magazine.techacademy.jp/magazine/9813)

