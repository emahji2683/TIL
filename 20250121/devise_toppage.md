# 経緯
卒業制作において、紹介ページによりアプリ概要を把握してから利用いただくために、トップページをログイン前に表示することにした。

# 実装の流れ
- ルートをトップページに設定
- コントローラー(共通)にログイン前の処理を抑止するコードを追加。
- コントローラー(トップページに)に例外処理を追加。

# 実際のコード
## ルートをトップページに設定
```
before_action :authenticate_user!
```

## コントローラー(共通)にログイン前の処理を抑止するコードを追加。
```
root "tops#index"
```

## コントローラー(トップページに)に例外処理を追加。
```
class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
end
```

# 参考資料
- [ログイン前にトップページを表示させる方法 #Ruby - Qiita](https://qiita.com/Izushi/items/8039a1ffc1795d3e2391)
