# chatさんより
2. 古いファイルをまとめてバックアップする
目的：30日以上更新していないファイルをold_backupディレクトリに移動する

bash
コピーする
編集する
mkdir -p old_backup
find ./project -type f -mtime +30 -exec mv {} old_backup/ \;
-mtime +30 → 最終更新日が30日より前

-exec → 条件に合うファイルごとにコマンドを実行

{}は見つかったファイル名の置き場

\;は-exec終了の合図

# 何がわからないか
- execが何かわからん
- -typeも使えるけどなんとなく
- -mtimeも
