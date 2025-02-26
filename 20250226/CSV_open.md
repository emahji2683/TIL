# CSV_openとは
CSVに書き込みを行うメソッド。

# 使用方法

openメソッドに引数として、書き込み対象ファイルパス、オプションを与える。また、このブロックとして、csvオブジェクトに投入する配列を挿入する。

```
CSV.open("ファイルパス", "オプション(w)") do |csv|
  csv << 投入する配列
end
```


# 使用例
## データ
## 実際のコード

```
CSV.open("./file.csv", "wb") do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
end
```

```
#CSVオブジェクト
#<CSV io_type:File io_path:"./file.csv" encoding:ASCII-8BIT lineno:0 col_sep:"," row_sep:"\n" quote_char:"\"">
```

| 各オプション             | 内容                                                                   |
|--------------------------|------------------------------------------------------------------------|
| #<CSV io_type:File ... > | CSVライブラリのオブジェクト                                            |
| io_type:File             | CSVオブジェクトがアクセスしているファイルのパス                        |
| encoding:ASCII-8BIT      | CSVの文字エンコーディング形式。。ASCII-8BITが指定。                    |
| lineno:0                 | linenoは、現在の行番号を示しています                                   |
| col_sep:","              | CSVファイル内で列を区切るために使われている区切り文字                  |
| row_sep:"\n"             | row_sepは、CSVファイル内で行を区切るために使用されている改行文字を示す |

※col(column)：列(横方向の仕切り)
※row(row)：行(縦方向の仕切り)


# 実行結果

# 参考資料
