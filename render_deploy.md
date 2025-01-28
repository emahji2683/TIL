# 経緯
render上において、aplication.cssファイルが存在しないエラーが発生していた。
これに対して、以下の通り、tailwindとesubuildによりbuildを行う行を追記することで本番環境で動作するようになった。

# 方法

## esbuildコマンドについて
bundle: 複数の入力ファイルを単一の出力ファイルにバンドルするかどうかを指定します。
sourcemap: ソースマップを生成するかどうかを指定します。

※ソースマップとは
Source Maps とは、ビルドやコンパイルされた JavaScript ファイルを元のソースコードにマッピングするファイルです。
以下の通り、mapが拡張子として、つくファイルのこと。

具体例：
ソースマップファイル: bundle.js.map

<details>
<summary>package.json</summary>

```
    "build": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds",
    "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify",
```
</details>

## tailwindcssコマンドについて
tailwindcss は Tailwind CSS の CLI ツールを呼び出し、CSS ファイルの生成・変換を行います。
### -iオプション
tailwindcssのcssを出力する元となるファイルを指定している。

<details>

<summary>render-build.sh</summary>

```
bundle install
yarn install
yarn build
yarn build:css
bundle exec rake assets:clobber
bundle exec rake assets:precompile # cssはsprocketsを使っているため
bundle exec rake db:migrate # cssはsprocketsを使っているため
```

</details>
