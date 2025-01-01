
#!/bin/bash

# ファイル名を設定
echo "検索する文字列を入力してください" 
read FILE_NAME

grep -rl "$FILE_NAME" .

# 成功メッセージを表示
echo "ファイル '$FILE_NAME' を探しました。"
