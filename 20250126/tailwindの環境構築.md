# 環境構築の流れ

- tailwindのインストール
- インプットファイル(src)とアウトプットファイル(dist)の指定、再生
- @tailwindディレクティブファイルの作成


# 前提知識
## @tailwindディレクティブとは
> @tailwindというディレクティブはbase、components、utilitiesという3つのオプションと一緒にCSSファイルに記述することで、ソースCSSファイルからビルドCSSファイルにコンパイルされ、特定のスタイルセットを読み込むことができます。簡単にですがそれぞれのコードを解説します。

## Just-In-Time機能とは
> 実際に使われたクラスだけを抽出してビルドする機能です。これによってファイルサイズが最適化されます。

## srcファイルとは
> srcは編集用(source)。プログラムを記述する。

## distファイルとは
> distは配信用(distribution)。本番環境で実際にブラウザに表示されるもの。

# 参考資料
- [webpackのdistとsrcフォルダの違い。dist配下のファイルはいつ作成されるか #webpack - Qiita](https://qiita.com/shizen-shin/items/bd67e2e566c2b047c0f8)
