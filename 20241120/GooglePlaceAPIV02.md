以下は、あなたが提供した情報を整理してマークダウン形式に書き直したものです：



# Google Place API

## 経緯



## 目的

Google Place APIを利用して、美術館などの施設情報を取得し、アプリケーションに反映させることを目的としています。



## Google Place APIの概要

### オプションとその内容

| オプション               | 内容                                                                 |
|-----------------------|----------------------------------------------------------------------|
| **json_result_object**    | データをJSON形式でまとめたもの                                         |
| **place_id**              | 場所ID                                                                |
| **vicinity**              | 郵便番号、国、都道府県を除いた住所                                   |
| **lat**                   | 緯度                                                                  |
| **lng**                   | 経度                                                                  |
| **viewport**              | 建物のある範囲（緯度・経度で北端と南端を示す）                        |
| **name**                  | 場所の名前                                                           |
| **icon**                  | Googleマップ上で使われるアイコン画像のURL                            |
| **types**                 | 場所の種別                                                           |
| **formatted_phone_number**| 電話番号                                                             |
| **international_phone_number** | 国際電話番号                                                   |
| **formatted_address**     | 住所                                                                  |
| **address_components**    | 住所データ詳細                                                       |
| **street_number**         | 通りの名前                                                           |
| **street**                | 町                                                                    |
| **city**                  | 都市                                                                  |
| **region**                | 地域                                                                  |
| **postal_code**           | 郵便番号                                                             |
| **country**               | 国                                                                    |
| **rating**                | ユーザーのレビューに基づく★評価（1.0〜5.0）                          |
| **price_level**           | 価格帯（0〜4の5段階で、4が一番高いレベル）                           |
| **opening_hour**          | 営業時間                                                             |
| **url**                   | Googleサイトで作成したページのURL                                    |
| **website**               | 公式WEBサイトのURL                                                  |
| **photos**                | 写真データ（配列）                                                    |
| **reviews**               | ユーザーからのレビュー（配列）                                       |
| **utc_offset**            | 世界標準時の起点となるイギリスとの時間差を分で換算したもの            |



## 実装項目と実装案

### ER図で実装予定のカラム

| カラム名称              | 備考                                          |
|-------------------------|-----------------------------------------------|
| **name (string)**        | 場所の名前                                    |
| **location (string)**    | 場所の位置情報（緯度・経度）                  |
| **main_picture (string)**| 施設の画像（ActiveStorageで実装）           |
| **business_hours (text)**| 営業時間                                      |
| **admission_fees (decimal)** | 料金（精度: 13、スケール: 2）            |
| **facilities_amenities (text)** | 設備・アメニティ情報                    |
| **website_url (string)** | 公式サイトのURL                              |
| **phone_number (string)**| 電話番号                                      |
| **created_at, updated_at** | 作成日時・更新日時（省略）                  |



### 実装できないカラム（データ収集の観点）

| 項目(ER図)               | 実装できない理由                                        |
|-------------------------|--------------------------------------------------------|
| **admission_fees**       | データが存在しない可能性が高い                          |
| **facilities_amenities** | 明確な項目がないため実装不可能                          |
| **photos**               | 階層化されたデータ形式（URLが記載された形でのみ取得）   |
| **location**             | 出力データが日本語でないため、地理的な場所情報を正しく取得できない可能性がある |



## Google Place APIで取得するデータ

| オプション               | 内容                                                                 |
|--------------------------|----------------------------------------------------------------------|
| **place_id**              | 場所ID                                                                |
| **vicinity**              | 郵便番号、国、都道府県を除いた住所                                   |
| **lat**                   | 緯度                                                                  |
| **lng**                   | 経度                                                                  |
| **name**                  | 場所の名前                                                           |
| **types**                 | 場所の種別                                                           |
| **formatted_phone_number**| 電話番号                                                             |
| **formatted_address**     | 住所                                                                  |
| **address_components**    | 住所データ詳細                                                       |
| **postal_code**           | 郵便番号                                                             |
| **rating**                | ユーザーのレビューに基づく★評価（1.0〜5.0）                          |
| **price_level**           | 価格帯（0〜4の5段階で、4が一番高いレベル）                           |
| **opening_hour**          | 営業時間                                                             |
| **url**                   | Googleサイトで作成したページのURL                                    |
| **website**               | 公式WEBサイトのURL                                                  |
| **photos**                | 写真データ（配列）                                                    |



## データの作成方法

データの作成方法については、Rails内でデータを生成する形になります。具体的な方法として、`Rake`タスクを使ってCSVファイルとして出力する方法を提案しています。



## 実証例（ビューへの実装）

以下は、ビューにGoogle Places APIを使ったデータを表示するためのコード例です。

### `reviews_controller.rb`

```ruby
@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
@clients = @client.spots(
  35.681236, 139.767125,  # 緯度・経度 (東京駅の例)
  radius: 1000,           # 半径 1000m
  detail: true,
  language: 'ja',
  keyword: '美術館'       # 検索キーワード
)
```

### `application_helper.rb`

```ruby
def generate_photo_url(photo)
  "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo.photo_reference}&key=#{ENV['GMAP_API_KEY']}"
end
```

### `index.html.erb`

```erb
<% if @clients.present? %>
  <% @clients.each do |x| %>
    <h1><%= x.name %></h1>
    <% if x.photos.present? %>
      <div>
        <% x.photos.each do |photo| %>
          <img src="<%= generate_photo_url(photo) %>" alt="Photo of <%= x.name %>" style="max-width: 100px;">
        <% end %>
      </div>
    <% else %>
      <p>No photos available.</p>
    <% end %>
  <% end %>
<% end %>
```



## 課金について

Google Places APIを使用する際、1回のリクエストに対して一定の課金が発生します。現在の課金状況は1.86万円であり、相殺されている模様です。



## Rakeタスクとしての実装

```ruby
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

   
