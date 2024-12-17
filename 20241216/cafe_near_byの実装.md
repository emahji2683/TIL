# どんな実装か
googlemapjavascriptAPIを用いて、各美術館の周辺のカフェを表示する。
対象は最も近い箇所を一箇所表示するものとする。

# 目的
公的統計により美術館来訪者はカフェにも行きたいと感じているため。

# 方法
- PlaceAPIによるカフェの実装
- GoogleMapAPIによる表示

# 具体的な方法
## PlaceAPIによるカフェの実装
- 美術館の座標を入力する
- 最も近いカフェの概要を出力する。

## GoogleMapAPIによる表示
- PlaceAPIによる座標を描画する。

# プロセス
## 文献調査

## 実装例の抽出


# 実装例
## サービスコントローラー
```
class CafesController < ApplicationController
  require 'net/http'

  def index
    # サンプルの緯度・経度 (美術館の位置を想定)
    lat = params[:lat] || 35.6895  # 東京駅周辺の緯度
    lng = params[:lng] || 139.6917 # 東京駅周辺の経度

    # Google Places API を呼び出してカフェ情報を取得
    @cafes = fetch_nearby_places(lat, lng, "cafe")
  end

  private

  # Google Places API でデータを取得
  def fetch_nearby_places(lat, lng, keyword)
    api_key = Rails.application.credentials.dig(:google, :places_api_key)
    base_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    uri = URI(base_url)
    params = {
      location: "#{lat},#{lng}",
      radius: 1000, # 半径 1km
      keyword: keyword,
      key: api_key
    }
    uri.query = URI.encode_www_form(params)

    # API リクエスト
    response = Net::HTTP.get(uri)
    JSON.parse(response)["results"]
  end
end
```


# 実装結果

# 課題

# 参考資料
- [chatGPT](https://chatgpt.com/share/67611a9f-5f5c-8003-bc2f-96102cb5752a)

