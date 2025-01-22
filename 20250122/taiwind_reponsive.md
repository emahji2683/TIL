# 経緯
卒業制作でサイトデザインを行っている時、CSSが自動でbuildされない事象が発生していた。

# 前提知識
そもそもrailsはbin/devでforemanを起動し、Procfile.dev中のプロセスを実行している。
今回の場合(yarnを使用)、プロセス中に定義されているコマンドの一部はpackage.jsonに定義されている。

## bin/devとは
foremanを起動させるコマンド・ファイル。

## foreman
> アプリの外部にあるProcfileというファイルに設定を書き込むと、WEBアプリの立ち上げに必要なさまざまなプロセスを一気に立ち上げることができます。
> Ruby on Railsなどを利用してWebサービスを開発する際、DBやキャッシュサーバ、バックグラウンドで実行が必要なものなど、複数のプロセスが必要になることがあります。

## Procfile.dev
foremanのプロセス管理ファイル。processname:commandという形で記載する。
以下通り、js:プロセスネームに記載のbuild:jsというコマンドはpackage.jsonに記載されている。

```
web: bin/rails server -b 0.0.0.0 -p 3000
js: yarn build:js
css: yarn build:css
```

## package.json
今回の場合でいえば、yarnでインストールされたソフトウェアの依存関係が整理されている。
> 　依存関係を示したファイルで、このファイルにプロジェクトに必要なパッケージの名前とバージョンを記述すればnpmが必要なパッケージをインストールする。
> 　package.jsonはnode環境のアプリの設定が書かれたファイルみたいなもので、Bundlerのようなもので、開発に使う依存ライブラリと本番で使う依存ライブラリを書くことができる。

### scriptsとは
以下の通り、yarn以下で実行するプロセスを略称等で定義できる。
> scripts は単純なビルド処理や開発ツールなど、パッケージに関係するタスクを自動化するための優れた方法です。

```
{
  "scripts": {
    "build-project": "node build-project.js"
  }
}
```

# 原因
Procfile.dev, package.json等に記載しているコードに--watchオプションが適切に設定されていなかったことによる。

# 対策方法
## Procfile.dev
- buildコマンドの削除
- build:css→--minifyオプションの削除, --watchオプションの追加
- build:js→--watchオプションの追加

<details>
<summary>package.json</summary>
```
-    "build:js": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds",
-    "build": "yarn build:js",
-    "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify",
+    "build:js": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds --watch",
+    "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --watch",
```
</details>

## Procfile.dev
以下の通り、--watchオプションをProcfile.devから削除した。

<details>
<summary>Procfile.dev</summary>

```
-js: yarn build:js --watch
-css: yarn build:css --watch
+js: yarn build:js
+css: yarn build:css
```
</details>

# 結果
自動でビルドされるようになった。

# 参考資料
- [bin/devってなんだ #Rails - Qiita](https://qiita.com/eichann/items/38968db7c7aa13c1f978)
- [gem foreman について簡単に知る #Rails - Qiita](https://qiita.com/sazumy/items/0237bcd01f482d831a0f)
- [[rails7] bin/devの役割とその仕組み #Rails - Qiita](https://qiita.com/sinke_123/items/20f93bdcf7cefce11da9)
- [Rubyのforemanの使い方を現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://magazine.techacademy.jp/magazine/22028)
- [package.json | Yarn](https://chore-update--yarnpkg.netlify.app/ja/docs/package-json)
