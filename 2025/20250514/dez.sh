
#!/bin/bash

# --- 設定 ---
SSID="iPhone"              # iPhoneのホットスポット名
PORT_NAME="Wi-Fi"          # 通常 "Wi-Fi"。MacBookで変えてない限りこれでOK

# --- Wi-Fiを再起動してiPhoneを認識させる ---
echo "[INFO] Restarting Wi-Fi..."
networksetup -setairportpower "$PORT_NAME" off
sleep 2
networksetup -setairportpower "$PORT_NAME" on
sleep 3

# --- SSIDスキャン（iPhoneが見えるか確認）---
echo "[INFO] Scanning nearby networks..."
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s | grep "$SSID"

# --- キーチェーンから認証して接続 ---
echo "[INFO] Connecting to '$SSID' using saved credentials..."
networksetup -setairportnetwork "$PORT_NAME" "$SSID"

# --- 現在の接続状態確認 ---
echo "[INFO] Verifying connection..."
CONNECTED_SSID_
