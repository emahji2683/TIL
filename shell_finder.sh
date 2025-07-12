#!/usr/bin/env bash
# usage: ./sort_md_by_birth.sh [TARGET_DIR]
# 指定ディレクトリ直下の *.md ファイルを
# 作成日 (birth time) ごとの yyyy-mm-dd ディレクトリへ移動する

DIR="${1:-.}"

# -name '*.md' を追加して Markdown のみ対象
find "$DIR" -maxdepth 1 -type f -name '*.md' | while read -r f; do
  # 1) 作成時刻 (birth time) を epoch 秒で取得
  if [[ $(uname) == "Darwin" ]]; then            # macOS (BSD stat)
    ts=$(stat -f %B "$f")                        # %B = birth epoch
  else                                           # Linux (GNU stat)
    ts=$(stat -c %W "$f")                        # %W = birth epoch
  fi

  # 2) 取れなければ更新時刻 (mtime) で代用
  [[ "$ts" -le 0 ]] && ts=$(stat -c %Y "$f")

  # 3) yyyy-mm-dd 形式に変換
  if [[ $(uname) == "Darwin" ]]; then
    dir=$(date -j -f %s "$ts" +%Y%m%d)
  else
    dir=$(date -d @"$ts" +%Y%m%d)
  fi

  # 4) ディレクトリ作成 & 移動
  mkdir -p "$DIR/$dir"
  mv -- "$f" "$DIR/$dir/"
  echo "moved $(basename "$f") → $dir/"
done
