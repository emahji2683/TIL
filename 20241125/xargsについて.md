# xargsについて
xargsは前のコマンドの実行結果を標準入力から受け取って、次のコマンドの引き数に渡して実行できます。以下の通り、echoから入力された文字列を引数として、rmを実行する。

```
echo "file1 file2 file3" | xargs rm

```

[xargsの便利な使い方が一目で分かる！初心者におすすめの記事](https://yossi-note.com/about_xargs/)
