# 該当のコード

```
arr = [5, 6, 7, 4, 1, 3, 4, 9, 14, 41, 341, 15, 55, 51, 554, 9, 154]

def get_min_value_with_index(arr, n, current_idx)
  min_value, min_index = arr[current_idx], current_idx
  (current_idx...n).each do |i|
    min_value, min_index = arr[i], i if min_value > arr[i]
  end
  return [min_value, min_index]
end

def main(param)
  arr = param.dup
  n = arr.size
  n.times do |i|
    min_value, min_index = get_min_value_with_index(arr, n, i)
    arr[min_index], arr[i] = arr[i], min_value
  end
  return arr
end

result = main(arr)

p result.join(' ') == arr.sort.join(' ')  #=> true
```

# 前提知識
## dupメソッド
dupメソッドとは、オブジェクトのコピーを作成するメソッドです。

```
original_object = ["a", "b", "c"]
copied_object = original_object.dup
p copied_object
```

# 処理の概要
- [Rubyで学ぶソートアルゴリズム #アルゴリズムとデータ構造 - Qiita](https://qiita.com/masayasviel/items/111ccdb02a56b19e78c9)


# 参考資料


