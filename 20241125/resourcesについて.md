
親・子テーブルの間に、1対多の関係性がある前提でこの関係性を踏まえて子テーブルのルーティングを作成する際、ネストされたresourceメソッドが使用される。
これにより、子テーブルのレコードのCRAD操作を行う際、対応する親テーブルのレコードの参照が行われる。以下のURLでは親テーブルの特定のレコードに対する子テーブルのレコードに対して、HTTPリクエストが行われている。

雑誌の広告一覧: GET /magazines/:magazine_id/ads

```
Rails.application.routes.draw do
  resources :magazines do
    resources :ads # 雑誌の中に広告をネスト
  end
end
```
