# Moduleとは
> Rubyにはオブジェクト指向で一般的なクラス以外にも、モジュールという概念が存在します。モジュールではクラスと同じように定数やメソッドをまとめたり、クラスに組み込んで多重継承を実現したり、クラスなどをまとめることで名前空間を提供するなど、いろいろな使い方ができます。

# モジュール内の記述
## 定数
変数名、モジュール名ともに大文字で定義する。変数名も大文字で定義することに留意する。

```
module モジュール名
  変数名(大文字) = 値
end

モジュール名::変数名
```

```
module Mod
  Version = "2.3.0"
end

Mod::Version #=> "2.3.0"
```

## インスタンスメソッド
module_functionでメソッド名を定義することで、モジュール外から呼び出せるようになる。

```
module モジュール名
  def メソッド名
  end

  module_function :メソッド名
end

モジュール名.メソッド名
```

```
module Mod
  def hello
    puts 'Hello'
  end

  module_function :hello
end

Mod.hello
```

## クラスメソッド

```
module モジュール名
  def self.メソッド名
  end
end

Mod.メソッド名
```
