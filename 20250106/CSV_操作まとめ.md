# 作成
generate

# 書き込み
open(wオプション)

# 読み取り

| メソッド             | 概要             |
|----------------------|------------------|
| open(オプションなし) |                  |
| read                 | 全て読み取り     |
| parse                | 文字列をパース(配列化)する？ |
| foreach              | 一行ずつ読み取り |

## parseとは
>  ここでの「パース (parse)」とは、文字列を解釈して構造化されたデータに変換することを指します。具体的には、文字列を特定のルールに従って分割し、それぞれの部分を取り出して利用しやすい形式に変換することです。
> ここで言う形式とは、配列やハッシュであることが多い

### 参考コード
カンマで区切られた文字列を構造化して、指定した列を読み込めるようになっている。

```
require 'csv'

tenki = <<EOS
1,2,3
ao,aka,kiiro
midori,shiro,kuro
EOS

parsed_data = CSV.parse(tenki) do |x|
  p x[1]
end
```


# 参考資料
- [Ruby 3.4 リファレンスマニュアルclass CSV](https://docs.ruby-lang.org/ja/latest/class/CSV.html)
