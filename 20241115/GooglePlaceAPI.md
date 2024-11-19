
# Google Place API
# 経緯




# 目的

# 方法

# Google Place APIの概要


|オプション|内容|
|---|---|
|json_result_object | データのJSON形式でまとめたもの|
|place_id|場所ID|
|vicinity|郵便番号、国、都道府県を除いた住所|
|lat|緯度|
|lng|経度|
|viewport|建物のある範囲（緯度・経度で北端と南端を示す）|
|name|場所の名前|
|icon|Googleマップ上で使われるアイコン画像のURL|
|types|場所の種別|
|formatted_phone_number|電話番号|
|international_phone_number|国際電話番号|
|formatted_address|住所|
|address_components|住所データ詳細|
|street_number|通りの名前|
|street|町|
|city|都市|
|regio|地域|
|postal_code|郵便番号|
|country|国|
|rating|ユーザーのレビューに基づく★評価（1.0〜5.0）|
|price_level|価格帯（0〜4の5段階で、4が一番高いレベル）|
|opening_hour|営業時間|
|url|Googleサイトで作成したページのURL|
|website|公式WEBサイトのURL|
|photos|写真データ（配列）|
|reviews|ユーザーからのレビュー（配列）もしデータ取得時に言語が指定されていれば、指定言語のレビューのみに限定される|
|utc_offset|世界標準時の起点となるイギリスとの時間差を分で換算したもの|



# 実証例



- [placeAPIGem](https://github.com/qpowell/google_places)
- [【Rails】Googleマップに掲載されている店舗情報をAPIで自由に取得する](https://labo.kon-ruri.co.jp/rails-google-places-api/)
