#!/bin/bash

# 価格変動のしきい値（パーセント）
THRESHOLD=5
# ビットコイン価格取得間隔（秒）
INTERVAL=30
# 初回価格を設定（空の状態でスクリプトを開始）
last_price=""

# CoinGeckoのビットコイン価格API URL
api_url="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"

while true; do
    # APIからビットコインの現在価格を取得
    current_price=$(curl -s "$api_url" | jq -r '.bitcoin.usd')

    # 取得した価格を確認し、nullや空の場合はエラーメッセージを出力
    if [ -z "$current_price" ] || [ "$current_price" = "null" ]; then
        echo "価格情報が取得できませんでした。再試行します。"
        sleep "$INTERVAL"
        continue
    fi

    # 初回実行時は基準となるlast_priceを設定
    if [ -z "$last_price" ]; then
        last_price=$current_price
        echo "初回価格を設定しました: $last_price USD"
        sleep "$INTERVAL"
        continue
    fi

    # 価格変動の計算
    price_change=$(echo "scale=2; (($current_price - $last_price) / $last_price) * 100" | bc)

    # しきい値を超えた場合、通知
    if (( $(echo "$price_change > $THRESHOLD" | bc -l) )) || (( $(echo "$price_change < -$THRESHOLD" | bc -l) )); then
        echo "価格変動検出！前回: $last_price USD -> 現在: $current_price USD ($price_change%)"
    else
        echo "価格変動なし：現在の価格は $current_price USDです。"
    fi

    # 前回の価格を更新
    last_price=$current_price

    # 次の取得まで待機
    sleep "$INTERVAL"
done
