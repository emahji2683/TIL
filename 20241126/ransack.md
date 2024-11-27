
[検索元](https://www.google.com/search?q=%E6%A4%9C%E7%B4%A2%E6%A9%9F%E8%83%BD%E3%80%80rails%E3%80%80ransack&client=firefox-b-d&sca_esv=a7c8b91352f94de3&sxsrf=ADLYWIJ9LfcTW4LguCr2dwVqStTZ1K8pLQ%3A1732695355774&ei=O9VGZ8_2Lpyl2roPl7uYyQc&ved=0ahUKEwiPgL2ZifyJAxWcklYBHZcdJnkQ4dUDCA8&uact=5&oq=%E6%A4%9C%E7%B4%A2%E6%A9%9F%E8%83%BD%E3%80%80rails%E3%80%80ransack&gs_lp=Egxnd3Mtd2l6LXNlcnAiHuaknOe0ouapn-iDveOAgHJhaWxz44CAcmFuc2FjazIGEAAYCBgeMggQABiABBiiBDIIEAAYgAQYogQyCBAAGIAEGKIESPEPUNUBWJ8OcAF4AZABAJgB9AGgAc0MqgEFMC4yLja4AQPIAQD4AQGYAgmgAuYMwgIKEAAYsAMY1gQYR8ICBBAAGB7CAggQABiiBBiJBZgDAIgGAZAGCpIHBTEuMi42oAfdEg&sclient=gws-wiz-serp)
[【Rails】ransackを使って検索機能の実装](https://qiita.com/mmaumtjgj/items/8731a70b3f328770867c)
[【Rails】 ransackを使って検索機能がついたアプリを作ろう！](https://pikawaka.com/rails/ransack)

# ransackとは
# 主な機能

# 処理の流れ
@qで検索パラメータがviewから送信される。
コントローラーで検索パラメータ(params[:q])を受け取る。
resultメソッドで絞り込みを行う。

# 実装方法
①ransackのインストール
②コントローラーの編集
③viewの実装

# 具体のコード

①ransackのインストール

## distinct: trueとは
distinct: true は、SQLクエリで 重複するレコードを排除 するためのオプションです。Railsでは、Active Recordのクエリメソッドにdistinct: trueを指定すると、生成されるSQLに SELECT DISTINCT が含まれ、同じ内容のレコードが重複して返されるのを防ぎます。

## includes(:user)とは
Ransackにおける includes は、 関連するテーブルを事前に読み込む ためのオプションで、通常のActive Recordの includes と同様に N+1クエリ問題を回避 する目的で使用します。

## page()とは
Ransack自体には直接 page() というメソッドはありませんが、 Ransack と ページネーション用のGem（例えば、 Kaminari や will_paginate）** を組み合わせることで、検索結果に対してページネーションを簡単に適用できます。

```
def index
  @q = Board.ransack(params[:q])
  @boards = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
end
```

②コントローラーの編集

```

```

③viewの実装

```

```
