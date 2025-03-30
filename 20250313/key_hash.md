# キーの書き方
シンボル、文字列で記述する2通りがある

## シンボルでの記述方法
### 前提知識
リテラルの一種。シンボルの記載方法、:(コロン)の横に識別子を記載することで記述する。

### ロケット

### リテラルとは
プログラミングにおいて、リテラルとは、プログラムのソースコード内に直接書かれた、不変の値のことを指します。


### 書き方
シンボルの書き方はkeyの左右にコロンを配置する2通りがある。

```
{ key: "value" }
```

```
{ :key => "value" }
```

## 文字列での記述方法

```
{ "key" => "value" }
```

# 記載例
以上に示した3パターンのkeyの書き方を実際に試したコードを以下に示す。hashに対して、文字列の場合は、keyの文字列をを引数として与えることにより、値が出力される。また、keyがシンボルの場合は、シンボルを引数としてハッシュに与えることにより、値が出力される。

```
def hash_string
  hash = { "first" => "val1" }
  hash["first"]  # ハッシュの値を返す
end

def hash_symbol_left
  hash = { :second => "val2" }
  hash[:second]  # シンボルでキーを使って値を返す
end

def hash_symbol_right
  hash = { third: "val3" }
  hash[:third]  # シンボルを使った別の書き方
end

puts hash_string  # "val1" が出力される
puts hash_symbol_left  # "val2" が出力される
puts hash_symbol_right  # "val2" が出力される
```


