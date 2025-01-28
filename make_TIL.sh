
#!/bin/bash
# スクリプトのパスを指定
SCRIPT_PATH="/Users/a81906/TIL/make_TIL.sh"
WORK_DIR="/Users/a81906/TIL/"

# 作業ディレクトリに移動
cd "$WORK_DIR" || { echo "作業ディレクトリへの移動に失敗しました。"; exit 1; }

# 今日の日付を取得（YYYY-MM-DD形式）
DATE=$(date +%Y%m%d)

# ファイル名を設定
FILE_NAME="$DATE"

# 新しいディレクトリを作成（既存の場合はエラーメッセージを表示）
if mkdir "$FILE_NAME" 2>/dev/null; then
  echo "ディレクトリ '$FILE_NAME' を作成しました。"
else
  echo "ディレクトリ '$FILE_NAME' は既に存在します。"
fi
