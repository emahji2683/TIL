# スライドウィンドウ法
## コード
長さkの連続文字列の内最大の文字列を出力するアルゴリズム。

```
def max_subarray_sum(arr, k)
  return nil if arr.length < k

  current_sum = arr[0...k].sum
  max_sum = current_sum

  (k...arr.length).each do |i|
    current_sum += arr[i] - arr[i - k]
    max_sum = [max_sum, current_sum].max
  end

  max_sum
end
```

## それぞれの変数
k: 探索する文字列の長さ
i: 現在の配列に加える数値の場所


## 実際の内容
