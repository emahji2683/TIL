- 前提条件
render, amazonS3で本番環境に画像保存機能を実装する。

- 関連資料の収集
[AWSのS3で本番環境の画像を保存する②Rails、renderでの設定](https://qiita.com/joinus_ibuki/items/774a79e9c828ecdc57b3)
[Active Storage の概要](https://railsguides.jp/active_storage_overview.html)


- 手順のまとめ
config/environments/production.rb
config/storage.ymlの編集
gem "aws-sdk-s3"の追加

- 実装
- 結果
- 課題
- 今後の対応
