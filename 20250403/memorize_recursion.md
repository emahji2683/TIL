# メモ化再帰とは
> 再帰関数内で、同じ引数の再帰関数を複数回呼び出すような実装では、その計算結果を保持しておくことで、複数回呼び出さないような実装にしようというのがメモ化再帰関数です。計算結果を配列に代入するという処理を加えるだけなので、非常に簡単にできる高速化になります。

# メリット

```
def fib(n)
  return n if n <= 1
  fib(n - 1) + fib(n - 2)
end
```
n: フィボナッチ数列のn項目
fib(3, memo)を実行した場合

`n <= 1`: false
`memo[3]`:false
memo[3] = fib(2, memo) + fib(1, memo)

1. fib(2, memo)が実行
前提条件: memo[2] = fib(1, memo) + fib(0, memo) == 1によりmemoに登録される。
1より、memo[n]はこの場合、memo[2]となり。memo[n]は存在するので。

2. fib(1, memo)が実行
returnで1が帰り値

これらよりmemo[3] == 2

```
def fib(n, memo = {})
  return n if n <= 1

  # すでに計算していれば再利用
  return memo[n] if memo[n]

  # 計算してメモに保存
  memo[n] = fib(n - 1, memo) + fib(n - 2, memo)
end
```

