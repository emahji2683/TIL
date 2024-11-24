# 対応の流れ
- リモートからのpushの削除

```
git reset --hard HEAD^
```

- .gitignoreの修正
以下の資料を参考にgitigonoreを修正した。

- cacheの削除と再push

```
git rm -r --cached .
```

[【Git】.gitignore の変更が反映されない→キャッシュ削除する方法](https://qiita.com/kohei_wd/items/f1d224c9257d1e242b58)
[git pushを取り消す方法](https://qiita.com/S42100254h/items/db435c98c2fc9d4a68c2)
[.gitignore の書き方。ファイル/ディレクトリの除外](https://www-creators.com/archives/1662)
