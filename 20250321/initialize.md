# initialize
> データを初期化するメソッド

# 使用方法
- newでinitializeメソッドが起動
- newから渡された引数によってinitializeメソッドでインスタンス変数を作成
-

```
class クラス名
  def initialize(引数1, 引数2)
    @変数名 = 引数1
    @変数名 = 引数2
  end
  def メソッド名
  end
end

定数 = クラス名.new(引数名1, 引数名2)

```

# 使用例

```
class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def info
    "商品名: #{@name}, 価格: #{@price}"
  end
end

product = Product.new("スマホ", 50000)
puts product.info  # => 商品名: スマホ, 価格: 50000
```
