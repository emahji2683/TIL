# 環境構築(Tailwind + Esbuild + Rails7 + Postgres)

## 経緯
卒業制作において、最初の環境構築を行った。
結果、tailwind:cssのファイルが見つからないとのエラーが発生した。

## 方法
基本的には以下のサイトを参考に環境構築を行った。

https://www.mof-mof.co.jp/tech-blog/2024/04/12/114220
https://www.mof-mof.co.jp/tech-blog/2024/04/03/154039

## 結果
- tailwind:cssのコマンドを実行すると、cssがbuildされた。
- このコマンドがどうやら抜けていたようだ。
- esbuild前提で、環境構築を行い後付けでtailwindを導入した方が良さそう。
