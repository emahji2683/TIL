# 概要
グラフを作成する際、横軸のラベルについてカラム名とするために、カラムの一覧配列を作成した。

# column_namesメソッド
column_namesメソッドを使用すると、特定のモデルのカラム一覧を配列として出力できる。ただし、id、created_atなど自動的に作成されるカラムも配列に含まれるので注意する。

> column_names()というメソッドがActiveRecord::Baseに用意されているので、それを使います。

# コード
``Modelname.column_names``

# 参考資料
- [【Rails3】テーブルのカラム名一覧を取得する](https://zucay.hatenadiary.org/entry/20120110/1326192117)

