# 正規表現zについて
末尾の文字列を表す。

# 使用方法
rubyのmatchメソッド等で使用する。以下の場合、参照文字列が文字列の末尾に存在する場合飲みtrueを返す。

```
文字列.match(/参照文字列\n/)
```

# 実行結果

```
str = "hello world"
p str.match?(/hello\z/)
p str.match?(/hello/)
```
