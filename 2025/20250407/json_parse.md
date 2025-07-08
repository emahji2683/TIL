# JSON.parseとは
jsonデータを特定のデータ型に変換するメソッド。rubyであればハッシュオブジェクト。

# 使用方法
```
require 'json'
file = File.open(ファイル名)
hash = JSON.parse(file)
p hash

```
