# データの処理の流れ
- CSVデータを作成する意図：アプリ側でデータを読み込むため。
- JSONデータを作成する意図：LLMで処理を円滑に進めるため。

| ファイル名                           | 処理内容                                                                                              | 目的 | データの場所 |
|--------------------------------------|-------------------------------------------------------------------------------------------------------|------|--------------|
| table_making_museums.sql             | CSVデータから各都道府県データを格納したテーブル(00~47)を作成する。                                    |      | home         |
| making_jsonf_for_chatGPT.sql         | <s>テーブル(00~47)から各都道府県のJSONファイルを作成する。</s>                                        |      | home         |
| json_integ.rb                        | 各都道府県のJSONデータからJSONLを</br>マージしたテーブル(merged_output.jsonl)を作成する。             |      |              |
| table_making_json_import.sql         | JSONLをマージしたテーブル(merged_output.jsonl)<br>からJSONB形式のファイルを格納したテーブルを作成する |      | home         |
| table_making_museums_json_expand.sql | テーブル(museums_json_expand)を作成する。                                                             |      | home         |
| table_insert_JSON.sql                | JSOB形式のファイルをテーブル(museums_json_expand)に投入する。                                         |      | home         |
| export_museums_json_expand_table.sql | テーブル(museums_json_expand)からCSVファイル(form_putting_chatGPT.csv)                                |      | home         |
| making_csv_for_chatGPT.sql           | テーブル(museums_json_expand)からCSVファイル(output.csv)                                              |      | home         |

