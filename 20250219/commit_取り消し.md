# 概要
コミットを取り消すコマンドについて調べた。

# 前提知識
## コミットとは
要するにローカルに変更記録を保存する行為。
> 追加・変更したファイルをGitに登録するためのコマンド」です。通常のファイル操作では変更した内容を上書き保存すれば、ファイルの内容が変更されますが、Gitのリポジトリに変更内容を登録（保存）するためには、git commitを使用する必要があります。

## プッシュとは
要するにリモートリポジトリに変更を反映する行為。これを行わないとリモートから他のメンバーが使用できない。
> 「プッシュ」とは、ローカルリポジトリの変更をリモートリポジトリに反映させる操作です。チームでの共同作業が行えるようになり、データのバックアップも行えるため、この点がプッシュのメリットと言えるでしょう。しかし、未完成のコードをプッシュしてしまうと、他のメンバーに影響を及ぼす可能性があるので注意が必要です。

# 方法
直前のコミットを取り消すには、``git reset --soft HEAD^``コマンドを使用する。
``--soft``オプションはワークディレクトリの内容をそのままで、コミットだけを取り消す。``HEAD^``は直前のコミットを意味する。なお、^(キャレット)と読む。
なお、revertもコミットを取り消す働きがある。

## HEADとは
> HEADとは、現在使用しているブランチの先頭を表す名前です。デフォルトではmasterの先頭を表しています。

## revertとresetの違い
resetが指定した位置までのコミットをすべて削除するのに対して、revertはそれまでのコミットも残してかつ戻った履歴も残す。

# 参考資料
- [[Git]コミットの取り消し、打ち消し、上書き #GitHub - Qiita](https://qiita.com/shuntaro_tamura/items/06281261d893acf049ed)
- [はじめてのGit！コミット(commit)でファイルを登録してみよう | 侍エンジニアブログ](https://www.sejuku.net/blog/71279)
- [Gitのコミットとプッシュの違いをわかりやすく解説 – trends](https://trends.codecamp.jp/blogs/media/difference-word148)
- [ブランチの切り替え｜サル先生のGit入門【プロジェクト管理ツールBacklog】](https://backlog.com/ja/git-tutorial/stepup/03/)
