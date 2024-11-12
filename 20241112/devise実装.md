# deviseのインストール
 Gemfileへの記載
```
gem 'devise'
```

- バンドルインストール

```
docker compose exec app bundle install
```

- deviseのインストール

```
docker compose exec app rails g devise:install
```

# モデル(User)の作成

- ユーザーモデルの作成
```
docker compose exec app rails g devise user
```
- マイグレーションの実施
```
docker compose exec app rails db:migrate
```

# カラムの追加

以下のような命名規則に従って実装されている。

```
add_{追加するカラム名}_to_{カラムを追加するモデル名を複数形で}
docker compose exec app rails g migration AddNameToUsers name:string
```

- ストロングパラメーターの実装

```
class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
```

# i18nの実装
今回deviseは日本語設定で実装する

- 専用のビューの作成
- これに対応したコントローラーの追加
- コントローラーの編集
- 日本語設定ファイルの追加
- deviseの設定ファイルの変更


# アクティブストレージの実装
- アクティブストレージのインストール
- モデルてのアソシエーションの追加
- ストロングパラメーターの編集

#

[deviseの実装](https://qiita.com/Ochanyoro/items/2a21c14194efedea4701)
[deviseについて(私記)](/Users/a81906/TIL/20241112/deviseとは.md)



