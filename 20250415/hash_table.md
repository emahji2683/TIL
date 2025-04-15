# アルゴリズム(ハッシュ探索法)
キーと値のセット(hash)をキーから生成したハッシュ関数によって、位置(index)を決定・格納する。
また、格納した値に対して、キー及びこれから生成したハッシュ値により探索する。

# コード

```
class HashTable
  def initialize(size)
    @buckets = Array.new(size) { [] }
  end

  def hash(key)
    key.sum % @buckets.size
  end

  def insert(key, value)
    index = hash(key)
    @buckets[index] << [key, value]
  end

  def search(key)
    index = hash(key)
    @buckets[index].each { |k, v| return v if k == key }
    nil
  end
end

hash_table = HashTable.new(10)
hash_table.insert("apple", "りんご")

puts hash_table.search("apple") # => りんご
```

# 解説
## 処理の流れ
- テーブルを作成(Hash_Table.new)
- ハッシュの格納(insert)
  - keyをhash関数に代入しindexを算出
  - indexにkey, valueを格納
- ハッシュの検索(search)
  - keyをhash関数に代入しindexを算出
  - indexを指定して、@bucketsから対象となる要素を抽出。
  - 対象となる要素がない場合、nilを帰り値とする。
## ハッシュ関数

@buckets: ハッシュを格納するテーブルのこと。
key.sum % @buckets.size: ハッシュ関数
key.sum: 各文字コードの合計
@buckets.size: ハッシュテーブルのバケット数

### sizeメソッド
lengthと同じ。配列であれば要素数を返す。
