
以下のコードはoriginal変数の配列をshallowcopyした後に、それを書き換えている。


```
original = [1, 2, [3, 4]]
shallow_copy = original.clone

shallow_copy[2][0] = 999
puts original.inspect  # => [1, 2, [999, 4]]
puts shallow_copy.inspect  # => [1, 2, [999, 4]]
```


