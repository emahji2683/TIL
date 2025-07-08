経緯：[**Docker&仮想サーバー完全入門　Webクリエイター＆エンジニアの作業がはかどる開発環境構築ガイド](https://www.amazon.co.jp/Docker-%E4%BB%AE%E6%83%B3%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC%E5%AE%8C%E5%85%A8%E5%85%A5%E9%96%80-Web%E3%82%AF%E3%83%AA%E3%82%A8%E3%82%A4%E3%82%BF%E3%83%BC%EF%BC%86%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%81%AE%E4%BD%9C%E6%A5%AD%E3%81%8C%E3%81%AF%E3%81%8B%E3%81%A9%E3%82%8B%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89%E3%82%AC%E3%82%A4%E3%83%89-%E3%83%AA%E3%83%96%E3%83%AD%E3%83%AF%E3%83%BC%E3%82%AF%E3%82%B9/dp/4295015318)を読み進め、実際にDocker触りながら進めている。そんな中、Ruby on Railsのコンテナ作成時に以下のコマンドの意味がわからなかったため。**

サービスを一度限りのコマンドとして実行します。

以下のコマンドは、 `web` サービスを開始し、コマンドとしての `bash` を実行します。

まず、—rmオプションの意味から調べていく。

```ruby
**docker compose run —rm web rails new . —force —no-deps —database=mysql**
```

## [クリーンアップ（--rm）](https://docs.docker.jp/engine/reference/run.html#id57)

　 `--rm` フラグにより**コンテナの終了時に、自動的にコンテナ内をクリーンアップし、ファイルシステムを削除する。**

　Dockerはコンテナを終了しても、コンテナのファイルシステムの内容を保持し続る。このため最後の状態を確認でき、デバッグはとても簡単になる。しかし、プロセスを短い期間だけ **フォアグラウンド**で動かしたとしても、これらのコンテナのファイルシステムが溜まり続ける場合があります
　(要するに短期間使用したプロセスも残り続けるのでファイル容量を圧迫すると言う意味か？)。

https://docs.docker.jp/engine/reference/run.html

※フォアグラウンド【foreground】：

　[複数](https://kotobank.jp/word/%E8%A4%87%E6%95%B0-617365)の[アプリケーションソフト](https://kotobank.jp/word/%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%BD%E3%83%95%E3%83%88-183245#T.E7.94.A8.E8.AA.9E.E3.81.8C.E3.82.8F.E3.81.8B.E3.82.8B.E8.BE.9E.E5.85.B8)が起動している[マルチタスク](https://kotobank.jp/word/%E3%83%9E%E3%83%AB%E3%83%81%E3%82%BF%E3%82%B9%E3%82%AF-9083#T.E7.94.A8.E8.AA.9E.E3.81.8C.E3.82.8F.E3.81.8B.E3.82.8B.E8.BE.9E.E5.85.B8)環境において、ある[アプリケーション](https://kotobank.jp/word/%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3-491)ソフトが[操作](https://kotobank.jp/word/%E6%93%8D%E4%BD%9C-552312)の[対象](https://kotobank.jp/word/%E5%AF%BE%E8%B1%A1-91307)となり、[コマンド](https://kotobank.jp/word/%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89-3447#T.E7.94.A8.E8.AA.9E.E3.81.8C.E3.82.8F.E3.81.8B.E3.82.8B.E8.BE.9E.E5.85.B8)の[入力](https://kotobank.jp/word/%E5%85%A5%E5%8A%9B-6987)ができる[状態](https://kotobank.jp/word/%E7%8A%B6%E6%85%8B-532446)にあること。⇔[バックグラウンド](https://kotobank.jp/word/%E3%83%90%E3%83%83%E3%82%AF%E3%82%B0%E3%83%A9%E3%82%A6%E3%83%B3%E3%83%89-7372#T.E7.94.A8.E8.AA.9E.E3.81.8C.E3.82.8F.E3.81.8B.E3.82.8B.E8.BE.9E.E5.85.B8)

[https://kotobank.jp/word/フォアグラウンド-8141#goog_rewarded](https://kotobank.jp/word/%E3%83%95%E3%82%A9%E3%82%A2%E3%82%B0%E3%83%A9%E3%82%A6%E3%83%B3%E3%83%89-8141#goog_rewarded)

※クリーンアップ：

　直訳すると、大掃除。パソコン用語としての意味は不要なデータを削除すること。 
https://support.biglobe.ne.jp/yogo/jpn_ku/jpn_ku004.html
