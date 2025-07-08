# コード

```
def FindIntersection(strArr)
  list1 = strArr[0].split(', ').map(&:to_i)
  list2 = strArr[1].split(', ').map(&:to_i)

  result = []

  list1.each do |num|
    result << num if list2.include?(num)
  end

  result.empty? ? "false" : result.join(',')
end
puts FindIntersection(["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"])
```

# 処理の流れ
- 文字列のセット(1,2)を,で分割する。
- それぞれのセットを,で分割する。
- このままでは文字列なのでmapで数字に変換する。
- include?でどちらからのセットのそれぞれの数値がもう一つのセットに含まれているか判別する。
- 含まれているなら、新しく配列に追加する。
- 最終的に文字列として出力するためjoinで文字列とする。この際のデリミタは`,`。

# ポイント
include?, empty?, 文字列から数値へ変換、数値から文字列へ変換。
