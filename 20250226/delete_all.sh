#!/bin/bash

# データベース名を指定
database="postgres"

# PostgreSQLに接続して、テーブル名を取得し、削除するSQLを実行
psql -U $(whoami) -d "$database" -t -c "SELECT tablename FROM pg_tables WHERE schemaname = 'public';" | while read table_name; do
  # テーブル名を削除
  psql -U $(whoami) -d "$database" -c "DROP TABLE IF EXISTS \"$table_name\" CASCADE;"
done
