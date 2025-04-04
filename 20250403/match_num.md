# コード

```
def match(target, arr)
  seen = {}
  arr.each do |num|
    return true if seen[target - num]  # もし (target - num) が seen にあればペア成立
    seen[num] = true  # num を記録
  end
  puts seen  # デバッグ出力
  false  # すべての要素を見てもペアがなければ false を返す
end

puts match(7, Array.new(10) { rand(1..10) })
```

# 解説
target - num: numのペアとなりnumと足し合わせるとtargetになる数

`return true if seen[target - num]`:target - numをキーとしてもつ要素を探索している。

