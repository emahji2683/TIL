
#!/bin/bash

# PDF to EPS Converter
# 使用方法: ./pdf2eps.sh input.pdf [output.eps]

# 入力ファイルのチェック
if [ $# -lt 1 ]; then
    echo "使用方法: $0 input.pdf [output.eps]"
    exit 1
fi

input_file="$1"

# 出力ファイル名の設定
if [ -z "$2" ]; then
    output_file="${input_file%.pdf}.eps"
else
    output_file="$2"
fi

# PDFからEPSへ変換
pdftops -eps "$input_file" "$output_file"

# 成功メッセージ
if [ $? -eq 0 ]; then
    echo "変換完了: $output_file"
else
    echo "変換に失敗しました"
fi
