#!/bin/bash

# CSVファイル名
CSV_FILE="museum_main_pages.csv"

# CSVファイルが存在するか確認
if [[ ! -f "$CSV_FILE" ]]; then
  echo "Error: $CSV_FILE does not exist."
  exit 1
fi

# CSVファイルを読み込んで処理する
while IFS=, read -r col1 col2 col3
do
  # 各列のデータを表示（必要に応じて変更）
  echo "Column 1: $col1"
  echo "Column 2: $col2"
  echo "Column 3: $col3"
  echo "----------------------"
  open $col2
done < "$CSV_FILE"
