# geocordingAPIとは

# どういったことができるか

# 導入方法
## 文献調査
[RailsのGeocoderとあそぼ](https://qiita.com/tiara/items/573fe5f1a84ca57dabcd)
[【Rails】 find_eachメソッドでメモリを節約して大量データを扱う方法](https://pikawaka.com/rails/find_each)
[ Rakeタスクを活用したRails管理者作成ガイド【Docker対応】](https://zenn.dev/take_tech/articles/60ee2607b762e4)
[chatGPTからの回答結果](https://chatgpt.com/c/6753e9ba-7c50-8003-90bc-8728581b0f19)


## 前提知識
### if
if 変数:変数が存在すれば、true、存在しなければfalseを返す。

### dotenv
ENV['変数名']


## 導入
- dotenvへのAPIの環境変数の導入


- gemの導入
```
gem 'geocoder'
gem 'csv'
```

- geocorderの設定ファイルを作成
```
Geocoder.configure(
  lookup: :google,
  api_key: 'YOUR_GOOGLE_MAPS_API_KEY',
  use_https: true,
  units: :km
)
```

- rakeタスクの実行
- 読み込み対象のCSVを設定、変数に代入(addresses)
- CSVにヘッダーを追追記
- addressesのそれぞれをrow[]に代入。


# 実装例
## rakeタスクの実行
### 実装例の参考
```
namespace :geocode do
  desc "Convert addresses to latitude and longitude and save as CSV"
  task to_csv: :environment do
    require 'csv'

    file_path = Rails.root.join('public', 'geocoded_addresses.csv')
    headers = ['Address', 'Latitude', 'Longitude']

    CSV.open(file_path, 'w', write_headers: true, headers: headers) do |csv|
      Address.find_each do |address|
        # Geocode the address if latitude and longitude are missing
        if address.latitude.blank? || address.longitude.blank?
          address.geocode
          address.save!
        end

        csv << [address.full_address, address.latitude, address.longitude]
      end
    end

    puts "CSVファイルが生成されました: #{file_path}"
  end
end
```



### 実装


# 実装結果
とりあえずは、変化後あとの緯度経度をCSVに登録した。


# 課題・今後の方針

