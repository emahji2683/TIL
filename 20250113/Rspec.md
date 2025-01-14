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

## FactoryBotの設定を行う
### FactoryBotとは
Rspecでテストを行う際にテストデータの作成をサポートするGemです。

### 使用方法
- Factory_botモデルの作成
- ダミーデータの追記
- spec.rbでの活用


## Factory_botモデルの作成
このモデルにテストデータの概要を記載する。具体的には、どのカラムのどのようなデータを入れるかを記載する。
以下の例では、userオブジェクトのfullname, emailカラムにFakerで作成したダーミーデータの値を代入している。

```
FactoryBot.define do 
 factory :user do # どのモデルを使用するか規定
  full_name  { Faker::Name.name } #名前のようなダミーデータの生成
  email      { Faker::Internet.email } # メールアドレスのようなダミーデータの生成
 end
end
```

## ダミーデータの追記


## spec.rbでの活用

# 参考資料
- [【Ruby on Rails】RSpec（rspec-rails）を使ってみよう #Rails - Qiita](https://qiita.com/ukwhatn/items/468d2ee700f79b7c5587)
- [テスト駆動開発 - Google 検索](https://www.google.com/search?client=firefox-b-d&q=%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E9%96%8B%E7%99%BA)
- [RSpec基礎ざっくりまとめ - KEITA LOG](https://keita1899.hatenablog.com/entry/2024/12/19/194859)
- [【Rspec】FactoryBotとは #Ruby - Qiita](https://qiita.com/so__hei__/items/138ab9306e6c8f20fdc8)
