# form_with(modelオプションについて)
オブジェクトが渡されるモデルを指定することができる。

# プレフィックスとは
要するに従来生成するURLの前に、特定の文字を追加すること。

> Railsがルーティングに対して生成する名前付きルーティングヘルパー名の冒頭に文字を追加（プレフィックス）できます。
- [Rails のルーティング - Railsガイド](https://railsguides.jp/routing.html#%E3%83%AA%E3%82%BD%E3%83%BC%E3%82%B9%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0-rails%E3%81%AE%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88)
> 電話番号やコンピューターで、文字列の先頭に付される特定の文字列。データの種類を識別するためなどに用いられる。接頭数字。
- [プレフィックス（prefix）とは？ 意味・読み方・使い方をわかりやすく解説 - goo国語辞書](https://dictionary.goo.ne.jp/word/%E3%83%97%E3%83%AC%E3%83%95%E3%82%A3%E3%83%83%E3%82%AF%E3%82%B9/)

## 実装例
modelオプションにより、プレフィックスされたルーティングを追加する。
具体には、article/idをプレフィックスし、account/article/idとする。

```
form_with(model: [@account, @article]) 
```

# 参考資料
- [プレフィックス（prefix）とは？ 意味・読み方・使い方をわかりやすく解説 - goo国語辞書](https://dictionary.goo.ne.jp/word/%E3%83%97%E3%83%AC%E3%83%95%E3%82%A3%E3%83%83%E3%82%AF%E3%82%B9/)
- [Rails のルーティング - Railsガイド](https://railsguides.jp/routing.html#%E3%83%AA%E3%82%BD%E3%83%BC%E3%82%B9%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0-rails%E3%81%AE%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88)

