# 課題の内容
**First Reverse（最初の反転）**  
関数 `FirstReverse(str)` を作成してください。この関数は、渡された `str` パラメータ（文字列）を逆順にして返します。

例えば、入力された文字列が `"Hello World and Coders"` の場合、プログラムは `"sredoC dna dlroW olleH"` を返す必要があります。

---

**例：**  
入力: `"coderbyte"`  
出力: `"etybredoc"`

入力: `"I Love Code"`  
出力: `"edoC evoL I"`

---

**タグ：**  
文字列操作、無料問題

---

# rubyにおける文字列操作
## chars
> 文字列の各文字を文字列の配列で返します。(self.each_char.to_a と同じです) 
使用方法:

```
"文字列".chars
```
## reverse

> reverse は自身の要素を逆順に並べた新しい配列を生成して返します。 reverse! は自身を破壊的に並べ替えます。 reverse! は self を返します。 
使用方法: 
```
配列.reverse
```

# 実装案
文字列をcharsを用いて配列に変換し、reverseで逆の順番から並べる。

# 実装結果
結果、テストを通過した.

```
def FirstReverse(str)
  arr = str.chars
  arr.reverse!
  arr.join
end

# keep this function call here 
puts FirstReverse(STDIN.gets)
```


# 参考資料
- [【完全ガイド】Ruby文字列操作の基礎から応用まで15の実践テクニック | Dexall公式テックブログ](https://dexall.co.jp/articles/?p=1525)
- [【Ruby】文字列を任意の文字数で分割する方法 | コーヒーとエラーと私](https://code-brew.blog/ruby-string-scan/)
- [Array#reverse (Ruby 3.4 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Array/i/reverse.html)
