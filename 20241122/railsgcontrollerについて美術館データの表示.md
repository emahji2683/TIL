# 作成方法
モデル、スキャフォールドと同様にrails gを使用して作成する。
なお、モデルの小文字、複数形でコントローラー名は記載する。

```
rails g controller (モデルの複数形、小文字)
```
# 削除方法
以下の通り、コントローラー名を指定し、destroyで削除できる。

```
rails destroy controller (モデルの複数形、小文字)
 
```

# 参考文献
[rails generateコマンドを取り消す方法](https://qiita.com/shuhei_m/items/32731468ff64a8947222)
