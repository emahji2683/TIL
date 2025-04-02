# コード

```
seats = gets.chomp.to_i
pep, start = gets.chomp.split().map(&:to_i)

seleted_seats = (0..pep - 1).map { |i| ((start + i - 1) % seats) + 1}
puts seleted_seats.join(" ")
```

n人分のシート番号を列挙する。
まず原点を指定すると、その番号が最初の人のシート番号。
よって、残りのシート数は`n - 1`
次の人のシート番号はスタート番号+1


原点のシートは何も足さなくても参照される
よって残りのシート数は
