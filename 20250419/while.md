# whileメソッドについて
ある条件式がfalseになるまで、繰り返し処理を行うメソッド。
`while`の後に条件式を記載する。

```
while 条件式 do
  (繰り返したい処理)
end
```

# whileを仕様する時の留意点
whileの条件式にいつまでも合致しないと無限に処理が行われる危険性がある。

# 具体例
## while(条件式で止める)
ある値が1以下になるまで、処理を続けるコードを記載してみた。
今回は10と設定した。

```
time = 10
while time >= 1 do
  puts "time:#{time}は1以上です"
  time -= 1
end
```

## breakで止める例
```
time = 10
while time >= 1 do
  puts "time:#{time}は1以上です"
  time -= 1
  if time == 5
    puts "time:5でbreakにより処理を止めました"
    break
  end
end
```

# 参考資料
- [【Ruby】 while文での繰り返し処理をマスターしよう！ | Pikawaka](https://pikawaka.com/ruby/while)
