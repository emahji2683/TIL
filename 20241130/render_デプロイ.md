# コンソールの使用方法

SSHキーをローカルで参照して、render側に登録した。

[【Render,Rails,Docker】本番環境でログを見たり、コンソールを使う方法](https://qiita.com/sami_0085/items/da68c9e0ef92a94f4d8a)


# テーブルの更新
## 起こったエラー
reviewテーブルが生成されないというエラーが起こっていた。

## 原因
reviewsテーブルを生成するマイグレーションファイルがなんらかの理由で存在しなかったため。

## 対処法

以下の通り、データベースをリセットした後、スキーマファイルからテーブルを生成することにより解決した。
```
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset　
```


```
rails db:schema:load
```

[《Rails》renderでの本番環境でのマイグレーションの注意【初学者のオリアプ作成】](https://zenn.dev/d_miyabi/articles/0ce427f40d2306)
[【Rails/Render】本番環境でのマイグレーション](https://taro-poyota.hatenablog.com/entry/2024/05/03/122745)
[Renderでのデプロイが失敗した時の確認](https://qiita.com/hashioga2017/items/b69cb070c0073e9c26c7)
[chatGPT回答](https://chatgpt.com/share/674b057f-5b00-8003-bc04-7c83f06b3096)
