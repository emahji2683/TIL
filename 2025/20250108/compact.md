# 概要
卒業制作において、とあるカラムの平均値を算出していたところ、nilの値が含まれていたので、エラーとなった。
このため、compactメソッドを用いて、nilを除外した配列として破壊的メソッドとした。

# compactメソッドについて
> Array クラスで用意されている compact メソッドを使用すると、要素に nul が含まれるものを除外します。 

# 具体のコード

> コード
```
array = [1, 2, nil, 0, nil]
new_array = array.compact!
p new_array
```

> 出力結果
```
[1, 2, 0]
```

# 参考資料
- [配列から要素が「nil」のものを取り除く(compact)](https://www.javadrive.jp/ruby/array_class/index9.html)

