# 修飾子とは
修飾子(modifier)とは、1行で条件分岐や繰り返しを記述できる構文。
一般的に以下のように記述する。代表的なものとして、if修飾子、unless、until、while等がある。
```
処理 修飾子 条件
```

# if修飾子について
今回は、最もよく使用するであろう、``if修飾子``を特出しして解説する。if自体の機能の解説は割愛し、使用方法について、以下の通り記述する。

```
処理 if 条件
```

# 具体的なリファクタリング事例

```
num = 3
puts num 
if num > 2
puts "sample"
end

puts "sample" if num > 2
```


