# 文字列に対するindex
文字列に対して、角カッコ[]で数字もしくは、範囲を指定すると対象の文字列を出力できる。
先頭から参照する場合と、末尾起点で参照する場合がある。

# 文字列のうち1文字を参照する
まず、文字列の参照は負の数、正の数で行う場合がある。正の数で参照を行う場合、先頭文字が0で参照されるため数字の順番から1を引いた数で該当の数が参照される。
負の数で参照を行う場合、末尾の文字が-1で参照されるため数字の順番から1を引いた数で該当の数が参照される。
```
str = "applenringo" 
size = str.size

p str
p "先頭の数字(+参照):#{str[0]}"
p "先頭の数字(-参照):#{str[-size]}"
p "末尾の数字(+参照):#{str[(size - 1)]}"
p "末尾の数字(-参照):#{str[-1]}"
```

# 複数文字の参照
```
文字列[文字列の先頭インデックス..文字列の末尾index]
```

# コード例
```
str = "applenringo" 
p str
p str[0..4]
p str[-5..-1]
```
