# 経緯
APIリクエストを送信・受信する際に、受信されたデータがJSON形式出会ったためこれをハッシュに変換するために、JSONモジュールのparseメソッドを使用した。

# 概要

> 与えられた JSON 形式の文字列を Ruby オブジェクトに変換して返します。 

## JSON.parseの簡単な例


# 具体の実装
<details>

<summary>WikipediaAPIを叩いたコード</summary>

```
require 'uri'
require 'net/http'
require 'json'

# 文字列としてのURL
base_url = "https://ja.wikipedia.org/w/api.php"

# URIオブジェクトへ変換
uri = URI(base_url)

# query
params = {
  action: "query",
  list: "search",
  srsearch: "iphone",
  srlimit:  "2",
  format:  "json"
}

# ハッシュをエンコード(urlに変換)
uri.query = URI.encode_www_form(params)

# Net::HTTPでAPIリクエストを送信する
response = Net::HTTP.get(uri)

# JSON
results = JSON.parse(response)


```

</details>

# 結果
以下のようなレスポンスが得られた。
```
{"batchcomplete"=>"", "continue"=>{"sroffset"=>2, "continue"=>"-||"}, "query"=>{"searchinfo"=>{"totalhits"=>5599}, "search"=>[{"ns"=>0, "title"=>"IPhone", "pageid"=>2115905, "size"=>276475, "wordcount"=>25068, "snippet"=>"GPSも内蔵していたことで話題になった。 現在の最新モデルである<span class=\"searchmatch\">iPhone</span> 16 / <span class=\"searchmatch\">iPhone</span> 16 Plus、<span class=\"searchmatch\">iPhone</span> 16 Pro / <span class=\"searchmatch\">iPhone</span> 16 Pro Maxは 、2024年9月9日（日本時間10日 <span class=\"searchmatch\">iPhone</span>は、2000年 代初頭に先に開発が始まったiPadの派生製品であり", "timestamp"=>"2024-12-30T14:21:53Z"}, {"ns"=>0, "title"=>"IPhone 4S", "pageid"=>2441800, "size"=>55581, "wordcount"=>6151, "snippet"=>"Apple &gt; <span class=\"searchmatch\">iPhone</span> &gt; <span class=\"searchmatch\">iPhone</span> 4s <span class=\"searchmatch\">iPhone</span> 4S（アイフォーン フォーエス）は、Appleが開発、販売していた<span class=\"searchmatch\">iPhone</span>の第5世代目のモデルである、また スティーブ・ジョブズが最後に見届けた<span class=\"searchmatch\">iPhone</span>として知られている。 2011年10 月4日に<span class=\"searchmatch\">iPhone</span>", "timestamp"=>"2024-12-04T19:14:58Z"}]}}
```

# 参考資料
[https://docs.ruby-lang.org/ja/latest/method/JSON/m/parse.html](https://docs.ruby-lang.org/ja/latest/method/JSON/m/parse.html)
