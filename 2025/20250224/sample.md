
# リダイレクトとは
> リダイレクトとは「入出力の切り替え」という意味です．これは、標準入力を、キーボード以外のファイルに指定したり、標準出力をディスプレイ以外のファイルに指定したりすることです.

# 「>」と「>>」
UNIXコマンドである「>」、「>>」について以下の通り解説する。
``>``を使用すると左辺に指定した標準出力の結果でファイルを上書きする。つまり、元のファイルに内容が存在した場合、元の内容は消える。一方、``>>``を使用すると既存ファイルの末尾に左辺のコマンドの実行結果を追記する。元の内容は保持される。以下の項目でその検証結果を示す。

# 実施結果
## [>>]
新規に作成した``sample.txt``に対して、rubyファイルの実行結果を追記する。

```
ruby private.rb >> sample.txt
```

<details>

<summary>実行前</summary>

```
公開メソッド
プライベートメソッド
```

</details>  

<details>

<summary>実行後</summary>

```
公開メソッド
プライベートメソッド
公開メソッド
プライベートメソッド
```

</details>  

元のファイルの文字列を維持して、ファイル内容の末尾に文字列が追記されている。

## [>]
このメソッドは標準出力によってファイルの「上書き」を行う。

```
ruby private.rb >> sample.txt
```

<details>

<summary>実行前</summary>

```
ndleじゃdecimalポj

aprjp
```

</details>  

<details>

<summary>実行後</summary>

```
公開メソッド
プライベートメソッド
```

</details>  

以上のように、既存の文字列が消え、新規の文字列が追記されていることから上書きが行われている。

## 参考
今回使用したrubyのサンプルコードを以下に示す。詳細は割愛するが、privateメソッドを検証するコードである。
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

# 参考資料
- [コマンドプロンプト | リダイレクトでファイルへ出力するときに追加書き込みを行う](https://www.javadrive.jp/command/redirect/index2.html)
- [UNIXのリダイレクト、パイプ](https://www.ritsumei.ac.jp/~kht23151/joho/redirect.html)
