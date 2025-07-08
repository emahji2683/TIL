
museum_info.csvは検索対象のURLが記載されたファイル。
これをhtmlで改行？を削除後、nokogiri::htmlでパースしている。


CSV.foreach("museum_info.csv") do |line|
  url = line[0]
  # URLが無効ならスキップ
  next if url.nil? || url.strip.empty?
  html = URI.open(url.strip)
  doc = Nokogiri::HTML(html)

  location = doc.at_css('.mod_adress_head dl:nth-child(2) dd:nth-child(2)')&.inner_text&.strip
  # 改行コードを削除して整形（必要に応じて）
  location.gsub!(/〒\d{3}-\d{4}/, '').strip!
  facility_name = doc.at_css('.name')&.text&.strip || '情報なし'
  business_hours = doc.at_css('#si_BUSINESS_TIME')&.text&.strip || '情報なし'
  admission_fees =doc.at_css('#si_ADMISSION_FEE')&.text&.strip || '情報なし'

  phone_number = doc.at_css('.tel')&.text&.strip || '情報なし'

  # CSVに追記
  CSV.open(output_file, 'a', headers: true) do |csv|
    csv << [facility_name, location, business_hours, admission_fees, phone_number]
  end









(RubyでWebスクレイピング #3 Nokogiriを使いこなす)[https://zenn.dev/arao99/articles/a68d8039f85fa8]
(Nokogiriで使えるcssセレクタまとめ)[https://qiita.com/miyamasaru/items/0f0a0ccdd6daf683ecff]
