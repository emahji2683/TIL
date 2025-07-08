# 経緯

> private配下にメソッドを記述すると、そのメソッドはPrivateMethodになり、そのクラス内からしか呼び出すことができなくなります。
> privateメソッドはクラス外から呼び出せないと述べましたが、継承先のクラス内からは呼び出すことができます。

# 方針
- クラスを作成する
- pubメソッド、privateメソッドを作成する
- インスタンスを作成する
- クラス内からの呼び出しクラス中での呼び出しを実行する。

# 実装結果
```
class Example
  def pub_meth
    puts "公開メソッド"
    pri_meth
  end

  private

  def pri_meth
    puts "プライベートメソッド"
  end
end

ex = Example.new
ex.pub_meth
ex.pri_meth
```

クラス外からメソッドを呼び出した場合の結果。
```
private.rb:16:in `<main>': private method `pri_meth' called for #<Example:0x00000001007f6538> (NoMethodError)

ex.pri_meth
  ^^^^^^^^^
Did you mean?  pub_meth
```

# 参考資料  
- [Module#private (Ruby 3.4 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Module/i/private.html)
- [Privateメソッドについて #Rails - Qiita](https://qiita.com/mofuko0213/items/e3281279045a87a63cba)
