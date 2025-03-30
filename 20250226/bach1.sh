#!/bin/bash
# 対象のディレクトリ
directory="/Users/a81906/TIL/20250226/test"

# 配列の各ファイル名に対してループ処理
file_names=($(find "$directory" -type f -exec basename {} \;))

for file in "${file_names[@]}"; do
  # パスとファイル名を変数に格納
  path="/Users/a81906/TIL/20250226"
  file_name="$directory/$file"

  # ファイル名（拡張子なし）を取得
  table_name=$(basename "$file_name" .csv)

  output_file_name="/Users/a81906/TIL/20250226/json/form_putting_chatgpt_$table_name.json"

  # テーブル名をダブルクォーテーションで囲む（数字が始まる場合に対応）
  table_name="\"$table_name\""

  # psqlコマンドでSQLを実行
  psql -U $(whoami) -d postgres -v table_name="$table_name" -v file_name="'$file_name'" -f "$path/table_making_museums.sql"

  # 別のSQLファイルを実行
  psql -U $(whoami) -d postgres -v table_name="$table_name" -f "$path/change_area_pref.sql"

  # COPY コマンドでテーブルを JSON として出力
  psql -U $(whoami) postgres -c "
  COPY (
    SELECT to_json($table_name)
    FROM $table_name
  ) TO '$output_file_name';
  "

done
