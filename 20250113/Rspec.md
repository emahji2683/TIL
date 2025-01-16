# Rspecとは
## テスト駆動開発(Test-Driven-Development)
> テスト駆動開発（Test-Driven Development: TDD）とは、テストファーストなプログラムの開発手法です。つまり、プログラムの実装前にテストコードを書き（テストファースト）、そのテストコードに適合するように実装とリファクタリングを進めていく方法を指します。
> RSpecは、Ruby 向けの BDD（Behavior-Driven Development=振る舞い駆動開発）フレームワークです。

### メリット
- 後工程へバグを持ち越しにくい
- システムの要件をより深く理解できる
- 開発者が安心してコーディングでき、心理的負担が減る

## Rspecとは
> RSpecは、Ruby 向けの BDD（Behavior-Driven Development=振る舞い駆動開発）フレームワークです。

# 使用概要
- RSpecをセットアップする
- RSpec用のモデルを追記する
- FactoryBotの設定を行う

# 使用方法

## RSpecをセットアップする
### Gemfileの記載

```
group :development, :test do
  gem 'rspec-rails', '~> 6.1.0'
  gem 'factory_bot_rails'
  gem 'faker'
end
```

### Rspecのインストール
``rails generate rspec:install``

## RSpec用のモデルを追記する
テストの内容を記述するモデル。テストケースを記述したり、それらを分類する役割を持つ。

### モデルの生成 
`rails g rspec:model book`

- describe: テストをまとめる役割
- it: 一つのテストケースを定義する。

```
require "rails_helper"

RSpec.describe User, type: :model do
  desribe 'バリデーション' do
    it "全ての項目が正しく入力されている時" do
      expect(user).to be_valid
    end
  end
end
```

## FactoryBotの設定
### FactoryBotとは
> Rspecでテストを行う際にテストデータの作成をサポートするGemです。

### 使用方法
- Factory_botモデルの作成
- ダミーデータの追記
- spec.rbでの活用


## Factory_botモデルの作成
このモデルにテストデータの概要を記載する。具体的には、モデルを指定した前提でどのカラムのどのようなデータを入れるかを記載する。
```
rails g factory_bot:model モデル名
```

以下の例では、userオブジェクトのfullname, emailカラムにFakerで作成したダミーデータの値を代入している。

```
FactoryBot.define do 
 factory :user do # どのモデルを使用するか規定
  full_name  { Faker::Name.name } #名前のようなダミーデータの生成
  email      { Faker::Internet.email } # メールアドレスのようなダミーデータの生成
 end
end
```

### アソシエーションを含む場合
子モデルの側に``assciation: モデル名``の記述を行うことで、子モデルのオブジェクトを作成した際、親モデルのオブジェクトも自動的に生成される。

```
FactoryBot.define do
  factory :post do
    title { "Sample Post" }
    content { "This is a sample post content." }
    association :user  # アソシエーションの設定
  end
end
```

# 実装したコード
## 実装概要
以下のモデルのFactorybotモデルを作成した。各モデルのカラムないの値に関しては、Fakerを用いて生成した。また、Reviewモデルはアソシエーションを持っているため、モデルにこのアソシエーションを記述する必要があった。

- User
- Museum
- Review

## 記載方法まとめ
記載方法を以下に示す。対象とするモデルを指定した前提で、カラム名に値を指定していく流れとなっている。この値には、Fakerにより生成した値を用いることも可能である。Userモデルのbotに関しては、Deviseのカラムとなるように留意する必要がある。

```
FactoryBot.define do
  factory :モデル名 do
  カラム名 { 値 }
  end
end
```

## 実装したコード

<details>
<summary>user.rb</summary>

```
FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8) # メールアドレスのようなダミーデータの生成
    name       { Faker::Name.name } #名前のようなダミーデータの生成
    email      { Faker::Internet.email } # メールアドレスのようなダミーデータの生成
    password { password } # メールアドレスのようなダミーデータの生成
    password_confirmation { password } # メールアドレスのようなダミーデータの生成
  end
end
```
</details>

<details>
<summary>museum.rb</summary>

```
FactoryBot.define do
  factory :museum do
     name { "samplemuseum "}
     location { "toukyou" }
     business_hours { "18:00-21:00" }
     admission_fees { "300yen" }
     website_url { "url" }
     phone_number { "090-batubatu" }
     latitude { nil }
     longitude { nil }
     photo_url { nil }
  end
end
```
</details>

<details>
<summary>review.rb</summary>

```
FactoryBot.define do
  factory :review do # どのモデルを使用するか規定
    exhibition      { "anywhere" } #名前のようなダミーデータの生成
    body            { "sample" } # メールアドレスのようなダミーデータの生成
    exhibition_rate { 4 }
    museum_design_rate { 4 }
    access_rate        { 4 }
    museum_shop_rate   { 4 }
    association :museum
    association :user
  end
end
```
</details>

## 今後について
以下の対応を行う。

- Factorybotの最適化
- Rspecでの活用

# 参考資料
## Rspec関連
- [【Ruby on Rails】RSpec（rspec-rails）を使ってみよう #Rails - Qiita](https://qiita.com/ukwhatn/items/468d2ee700f79b7c5587)
- [テスト駆動開発 - Google 検索](https://www.google.com/search?client=firefox-b-d&q=%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E9%96%8B%E7%99%BA)
- [RSpec基礎ざっくりまとめ - KEITA LOG](https://keita1899.hatenablog.com/entry/2024/12/19/194859)
## Factorybot関連
- [【Rspec】FactoryBotとは #Ruby - Qiita](https://qiita.com/so__hei__/items/138ab9306e6c8f20fdc8)
- [Rails + RSpec + FactoryBot + FakerでTestを書いてみた。 #Ruby - Qiita](https://qiita.com/A-Hama/items/d1b0219b00eb1e9a14f5)
- [FactoryBotにおけるassociationとは #FactoryBot - Qiita](https://qiita.com/mmaumtjgj/items/a0eab1618c1f742517b9)
