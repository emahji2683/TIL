# SimpleCovとは
テストカバレッジ計測ツールのこと。

## テストカバレッジとは
テスト対象範囲の全体の内どれくらい網羅しているかを示す指標です

# 導入方法
- gemのインストール
- .gitignoreへの追記
- helperへの追記

# 具体のコード

## gemのインストール
<details>

<summary></summary>

```

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "simplecov"
end
```

</details>  

## .gitignoreへの追記
<details>

<summary>.gitignore</summary>

```
# simpelecov
/coverage/
```

</details>  


## helperへの追記
以下の通り、simplecovをrails_helperで読み込むようにした。

<details>

<summary>spec/rails_helper.rb</summary>

```
require 'simplecov'
SimpleCov.start
```

</details> 

# 参考資料
- [Code coverage for App](file:///Users/a81906/Desktop/ArtVibe/coverage/index.html#_AllFiles)
- [Ruby on RailsでRSpecとSimpleCovを使ってテストでカバレッジ取得までやってみた - とことんDevOps | 日本仮想化技術のDevOps技術情報メディア](https://devops-blog.virtualtech.jp/entry/2022/02/08/131718)
