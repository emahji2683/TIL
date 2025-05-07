#!/bin/bash

SCRIPT_PATH="/Users/a81906/TIL/git_submit.sh"
WORK_DIR="/Users/a81906/TIL/"

# 作業ディレクトリに移動
cd "$WORK_DIR" || { echo "作業ディレクトリへの移動に失敗しました。"; exit 1; }

# 今日の日付を取得（YYYY-MM-DD形式）
DATE=$(date +%Y-%m-%d)

# ブランチ名を設定
BRANCH_NAME="$DATE"

# 新しいブランチを作成し、切り替え
git checkout -b $BRANCH_NAME

# 変更をステージング
git add .

# コミットメッセージを設定
COMMIT_MESSAGE="Add learning records for $DATE"

# 変更をコミット
git commit -m "$COMMIT_MESSAGE"

# リモートリポジトリにプッシュ
git push origin $BRANCH_NAME

# GitHubでプルリクエストを作成
/opt/homebrew/bin/gh pr create --base main --head $BRANCH_NAME --title "Add learning records for $DATE" --body "This PR adds learning records for $DATE."

# プルリクエストをマージ
/opt/homebrew/bin/gh pr merge --auto --merge


open "https://github.com/emahji2683"

# 成功メッセージを表示
echo "ブランチ '$BRANCH_NAME' を作成し、変更をコミットしてプッシュしました。プルリクエストが作成され、マージされました。"
