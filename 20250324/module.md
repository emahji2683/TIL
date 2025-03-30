# Moduleとは
> Rubyにはオブジェクト指向で一般的なクラス以外にも、モジュールという概念が存在します。モジュールではクラスと同じように定数やメソッドをまとめたり、クラスに組み込んで多重継承を実現したり、クラスなどをまとめることで名前空間を提供するなど、いろいろな使い方ができます。

# モジュール内の記述
モジュール内においては、定数、メソッド(インスタンス、クラス)が定義できる。

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
### 前提知識

module_function(モジュールの関数)でメソッド名を定義することで、モジュール外から呼び出せるようになる。

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
クラスメソッドの場合は、module_funtionを定義せずともメソッド名のみメソッドを呼び出すことができる。

```
module モジュール名
  def self.メソッド名
  end
end

Mod.メソッド名
```

# モジュールの応用
モジュールの応用事例としては、他のクラスでメソッドを使用できるようにする(ミックスイン)、ネームスペースの定義等がある。

- クラスにインスタンスメソッドを追加する(ミックスイン)
- クラスにクラスメソッドを追加する(ミックスイン)
- クラス名などの重複を防ぐためにネームスペース(名前空間)を作成する

## 前提知識
### ミックスインとは
> モジュール（module）をクラスに組み込むことで、クラスにメソッド(インスタンス、クラス)を追加できる仕組みのことです。

## クラスにインスタンスメソッドを追加する(ミックスイン)
> include を使うと、モジュールのメソッドがインスタンスメソッドとしてクラスに追加されます。

```
module Greet
  def hello
    puts "こんにちは！"
  end
end

class User
  include Greet
end

user = User.new
user.hello  # => こんにちは！
```

## クラスにクラスメソッドを追加する(ミックスイン)
> extend を使うと、モジュールのメソッドがクラスメソッドとして追加されます。

```
module Greet
  def hello
    puts "こんにちは！"
  end
end

class User
  extend Greet
end

User.hello  # => こんにちは！
```

## クラス名などの重複を防ぐためにネームスペース(名前空間)を作成する
### 名前空間とは
メソッドをカプセル化すること。同名のメソッド、変数が衝突しないようにする。逆に、衝突した場合は、後述されたメソッドで前述のメソッドが上書きされる。
> 名前空間とは、メソッド名や変数名などが衝突しないようにするための機能のことです。例を使いながら簡単に説明します。

### 名前空間の定義事例
以下の通り、同名メソッド・クラスの衝突を避けるため、moduleを用いて名前空間を定義した。結果として、衝突は起きなかった。

```
module Myapp
  class User
    attr_accessor :name
    def initialize(name)
      @name = name
    end
  end
end

module OtherApp
  class User
    attr_accessor :name
    def initialize(name)
      @name = name
    end
  end
end

puts Myapp::User.new("EM").name =>"EM"
puts OtherApp::User.new("OtherM").name =>"OtherM"
```

# 参考資料
- [Rubyの名前空間（namespace）について現役エンジニアが解説【初心者向け】 | TechAcademyマガジン](https://magazine.techacademy.jp/magazine/22391)
- [Moduleのミックスインと名前空間に関して [Ruby]｜koki.](https://note.com/kokitecture/n/n1595aeb7d8a9)
