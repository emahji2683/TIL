# 経緯
アプリにおいて、パスワードリセットメールを送信したところ、エラーがおこった。エラーの概要は以下の通り。

```
ERROR --  ActionView::Template::Error (Missing host to link to! Please provide the :host parameter, set default_url_options[:host], or set :only_path to true):
```
和訳すると以下の通り、

```
ActionView::Template::Error (リンク先のホストが不足しています！:host パラメータを指定するか、default_url_options[:host] を設定するか、:only_path を true に設定してください):
```
リンク先のホストがないとのこと。default_url_options[:host]が設定できていないことが原因である？

# 解決策
configファイル内の本番環境用設定ファイルが以下のようになっていた。

``config/environments/production.rb ``
```
  config.action_mailer.default_url_options = { host: ENV['APPLICATION_URL'], protocol: "https" }
```


# 参考資料
- [Rails Missing host to link to! のエラーが出た時　 #Rails5 - Qiita](https://qiita.com/jonnyjonnyj1397/items/e31fe746623af74dc5fc)

