
# CSVファイルとは
CSV = Comma-Separated Values
カラムのデータがカンマ(,)で区切られたテキストファイルまたはデータのことです。
詳しくは分からないので深く知りたい方は調べてみてください。

# seedとは
データベースに初期データを投入するファイル。

# メリット
まとめてデータベースにファイルを登録できる。

# 使用方法
- db/seed.rbファイルを保存する。 
- rails db::seedを入力する。

# 具体のコード
読み込み対象のファイルを選択し、対象とするカラム名と書き込み先のカラムを入力する。この上で、モデル名とcreateでデータベースへ実際の保存を行う。

- 読み込みファイルの選択
- 読み込み列と書き込み先ファイルの対応付け。

```db/seed.rb
require "csv"

CSV.foreach('db/seeds/csv/content.csv', headers: true) do |row|
  Content.create(
    title: row['title'],
    image_url :row['image_url'],
    director: row['director'],
    description: row['description'],
    open_date: row['open_date']
  )
end
```

# 参考資料
- [【Rails】rake seedコマンドでCSVファイルからDBに読み込ませる方法](https://qiita.com/mmmasuke/items/545afaf5876d3dc52670)
- [データベースに初期データを投入](https://railsdoc.com/page/rails_db_seed)
