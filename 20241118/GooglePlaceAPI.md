
# Google Place API
# 経緯

# 目的
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

# 方法
## 抽出するデータ項目

以下の実装可能であり必要性が高い機能と、実際の実装案(ER図)を比較したとき、実装が困難そうな項目は以下の通り。

|項目(ER図)|実装できない理由|
|---|---|
|admisshion_fees|データがなさそう|      
|facilities_amenities|こちらはそもそも項目がない|  
|photos|このデータは階層化している(対象画像のURLが記載？)|  
|location|出力データが日本語となっていない|

|オプション|内容|
|---|---|
|place_id|場所ID|
|vicinity|郵便番号、国、都道府県を除いた住所|
|lat|緯度|
|lng|経度|
|name|場所の名前|
|types|場所の種別|
|formatted_phone_number|電話番号|
|formatted_address|住所|
|address_components|住所データ詳細|
|postal_code|郵便番号|
|rating|ユーザーのレビューに基づく★評価（1.0〜5.0）|
|price_level|価格帯（0〜4の5段階で、4が一番高いレベル）|
|opening_hour|営業時間|
|url|Googleサイトで作成したページのURL|
|website|公式WEBサイトのURL|
|photos|写真データ（配列）|

[museumモデル](./スクリーンショット\ 2024-11-16\ 13.47.19.png)
i
## データの作成
データの作成方法は？Rails内でデータを生成する？

## 都道府県
広島県、東京都

## データの読み込み
Rake?Seed?

# 実証例
## ビューに直接実装したパターン
以下の通り、記載したところ動作を確認できた。
一方で、以下のような課題がある。
- 施設の内観写真のみが表示されている。
- このまま本番環境で実装するとAPIkeyが流出する。

### reviews_controller.rb 
```
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
    @clients = @client.spots(
      35.681236, 139.767125, # 緯度・経度 (東京駅の例)
      radius: 1000,          # 半径 1000m
      :detail => true,
      :language => 'ja',
      keyword: '美術館'# 検索キーワード
    )
```

### application.helper.rb
```
  def generate_photo_url(photo)
    "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo.photo_reference}&key=#{ENV['GMAP_API_KEY']}"   
  end
```

### index.html.erb

※if falseを除いて実装する必要あり。
```
<% if false %>
  <% @clients.each do |x| %>
    <h1><%= x.name %></h1>
    <% if x.photos.present? %>
      <div>
        <% x.photos.each do |photo| %>
          <img src="<%= photo %>" alt="Photo of <%= x.name %>" style="max-width: 100px;">
        <% end %>
      </div>
    <% else %>
      <p>No photos available.</p>
    <% end %>
  <% end %>
<% end %>
```

### 課金について
i4kのリクエストが発生している状況。この1リクエストに対していくらの費用がかかっている？以下の表にPlaces APIの使用状況画像を載せる。
課金状況は1.86万円であるが相殺されている模様。

![トラフィック状況](./スクリーンショット\ 2024-11-18\ 12.25.44.png)
![トラフィック状況](スクリーンショット 2024-11-18 12.35.24.png)
![お支払い状況](./スクリーンショット\ 2024-11-18\ 12.39.53.png)


- [google_cloudコンソール](https://console.cloud.google.com/apis/dashboard?hl=ja&inv=1&invt=Abhx0w&project=grdurunteq)
- [google_課金表](https://developers.google.com/maps/documentation/places/web-service/usage-and-billing?hl=ja)


- [placeAPIGem](https://github.com/qpowell/google_places)
- [【Rails】Googleマップに掲載されている店舗情報をAPIで自由に取得する](https://labo.kon-ruri.co.jp/rails-google-places-api/)

## Rakeタスクとして実装
```
namespace :api do
  desc "Fetch art museum data in Hiroshima (filtering by address) and export to CSV"
  task fetch_art_museums: :environment do
    require 'csv'

    # APIキーの取得とクライアント初期化
    api_key = ENV['GOOGLE_PLACES_API_KEY']
    client = GooglePlaces::Client.new(api_key)

    # 検索条件の設定
    location = [35.6938, 139.7035] # 広島市の緯度経度
    radius = 50000 # 50km以内
    type = 'museum'

    # Google Places APIでデータ取得
    places = client.spots(location[0], location[1], radius: radius, types: [type], language: 'ja')

    # 美術館をフィルタリング（住所に「広島県」を含む、名前に「美術館」を含む）
    art_museums = places.select do |place|
       place.name.include?('美術館')
    end

    # データが存在しない場合の処理
    if art_museums.empty?
      puts "No art museums found in Hiroshima with the specified conditions."
      return
    end

    # CSVファイル出力
    file_path = Rails.root.join('tmp', 'hiroshima_art_museums.csv')
    CSV.open(file_path, 'wb', encoding: 'UTF-8') do |csv|
      csv << ['名前', '住所', '評価', 'プレイスID'] # ヘッダー行
      art_museums.each do |museum|
        csv << [
          museum.name,
          museum.vicinity,
          museum.rating || 'N/A',
          museum.place_id
        ]
      end
    end

    puts "Art museum data has been exported to #{file_path}"
  end
end
```
