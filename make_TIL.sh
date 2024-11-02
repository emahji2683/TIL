
#!/bin/bash

# 今日の日付を取得（YYYY-MM-DD形式）
DATE=$(date +%Y%m%d)

# ファイル名を設定
FILE_NAME="$DATE"

# 新しいファイルを作成
mkdir "$FILE_NAME"

# 成功メッセージを表示
echo "ファイル '$FILE_NAME' を作成しました。"
