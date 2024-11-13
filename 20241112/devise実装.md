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
rails db:migrate
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
admin/user等のモデルが存在する場合、viewsの後にモデル名を追加するケースもある。

docker compose exex app rails g devise:i18n:views


- これに対応したコントローラーの追加

以下の通り、deviseの専用コントローラーを追加する？

```
rails g devise:controllers users
```

```
devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
```

- コントローラーの編集
- 日本語設定ファイルの追加
- deviseの設定ファイルの変更
```
rails g devise:i18n:locale ja
```

# アクティブストレージの実装
- アクティブストレージのインストール
```
docker compose exec app rails active_storage:install
docker compose exec app rails db:migrate
```


- モデルてのアソシエーションの追加
```
class User < ApplicationRecord
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


```



- ストロングパラメーターの編集
```
class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:account_update, keys: [ :image])
  end
end
```

[deviseの実装](https://qiita.com/Ochanyoro/items/2a21c14194efedea4701)
[deviseについて(私記)](/Users/a81906/TIL/20241112/deviseとは.md)



