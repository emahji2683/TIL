# initializeメソッドとは

> このメソッドは Class#new から新しく生成されたオブジェクトの初期化のために呼び出されます。他の言語のコンストラクタに相当します。デフォルトの動作ではなにもしません。 

# 初期化とは
すでに定義されているインスタンス変数を上書きすることと考えられる(調査したが文献が見つからなかった)。今回の事例では、initializeを2回目のnewの際実行したが、incrementで加算された@countの値が初期化され2会のincrementの実行が2となっている。

```
class Counter
  def initialize
    @count = 0  # 初期化されていないとエラーが発生する
  end

  def increment
    @count += 1
  end

  def current_count
    @count
  end
end

counter = Counter.new
counter.increment
puts counter.current_count  # => 1
counter = Counter.new
counter.increment
counter.increment
puts counter.current_count  # => 1
```
# 参考資料


