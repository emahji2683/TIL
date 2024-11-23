# 概要
生徒のデータを追加・表示するコードを書く。データ内容は、出席番号、名前の二種類。


# 処理の流れ
データの量がまず渡され、その後データの処理方法と対照データが渡される処理の流れとなっている。

## データの表示
1. インスタンスが格納された配列(members)を与えられたデータ参照により、指定する。
2. そのインスタンスに対して処理を実行する(getnum or getname)。この場合、インスタン内の定数(Ex.@name)の具体的な内容を表示する。

## 


# 具体のコード

```
input_line = gets
puts "XXXXXX"
class Member
  def initialize(num, name)
    @num = num
    @name = name
  end
  
  def getnum
    @num
  end
  
  def getname
    @name
  end 
end

n = gets.chomp.to_i
members = []

n.times do
  member = gets.chomp.split
  action = member[0]

  case action
  when "make"
    number = member[1].to_i
    name = member[2]
    members << Member.new(number, name)

  when "getnum"
    num = member[1].to_i - 1
    puts members[num].getnum

  when "getname"
    num = member[1].to_i - 1
    puts members[num].getname
  end
end
```
