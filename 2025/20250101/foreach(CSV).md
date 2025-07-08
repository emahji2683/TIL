# foreach(CSV)とは
要するにCSVの各行を読み込むためのメソッド。

>このメソッドは CSV ファイルを読むための主要なインターフェイスです。各行が与えられたブロックに渡されます。ブロックが与えられていない場合、Enumeratorを返します。  
<br>
- [rubyリファレンスマニュアル](https://docs.ruby-lang.org/ja/latest/method/CSV/s/foreach.html)


# 実装方法
以下の通り、読み込む対象のファイルパス(path)と読み込み際のオプションを定義する。

```
require 'csv'
CSV.foreach(path, options){|row| p row }
```

# 実装例



# 実装結果

# 課題

# 今後の展開

# 参考資料
