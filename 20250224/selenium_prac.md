# seleniumu-webdriverとは
> Selenium（セレニウム）は、Webアプリケーションのテストの自動化をサポートするオープンソースフレームワークであり、2004年に開発されました。多くのブラウザ操作を外部のプログラムから直接制御するAPIを提供しています。     

# 前提知識
## 技術名とは

# 実装方法
## 処理の流れ
セレニウムを起動後、サイトにアクセスする。この前提で、対象のサイトの要素とアクションを指定して処理を行う。

- セレニウムを起動(ローカル)
- 処理対象のサイトにアクセス(driver.get)
- 処理対象の要素を指定(driver.find_element)
- 動作を指定。(要素.action.動作名)
- 終了(driver.quit)

# 実装結果

## セレニウムを起動(ローカル)
以下の通り、ドライバーを起動する。この際、ブラウザの種類を指定する。
```
driver = Selenium::WebDriver.for :firefox
```
## 処理対象のサイトにアクセス(driver.get)
以下の通り、driverをインスタンスとしたgetメソッドを行うことにより、対象のサイトにアクセスする。

```
driver.get 'http://localhost:3000'
```

## 処理対象の要素を指定(driver.find_element)
対象とする要素の種類を指定して、アクセスを行う。
今回の場合は、tag_name(要素名)のうち、ボタン(a)に対してアクセスする。
```
top_button = driver.find_element(要素種類: 'a')
```

## 動作を指定(要素.action.動作名)

```

```

## 終了(driver.quit)


```
require 'selenium-webdriver'

# Chromeブラウザを起動
driver = Selenium::WebDriver.for :firefox

# サイトにアクセス
driver.get 'http://localhost:3000'  # http:// を追加

# ページタイトルを表示
puts driver.title

top_button = driver.find_element(tag_name: 'a')
top_button.click

# ユーザーEメール
user_mail = driver.find_element(id: 'user_email')

# ユーザーパスワード
user_pass = driver.find_element(id: 'user_password')

driver.action.send_keys(user_mail, '').perform
driver.action.send_keys(user_pass, '').perform

# ログインをクリック
login_button = driver.find_element(name: 'commit')
login_button.click

# スクリーンショットを保存
driver.save_screenshot('zenn.png')
puts "スクリーンショットされました！"

driver.quit
```


# 参考資料  
- [Ruby + Seleniumでweb上のファイルをダウンロードする(Windows) #Ruby - Qiita](https://qiita.com/kei3524848/items/c4bc486a5cda51158efe)
- [WebDriverとは【3分でわかる】インストール方法や基本の使い方を解説 │ TechMania](https://techmania.jp/blog/webdriver/)
- [ドライバーセッション | Selenium](https://www.selenium.dev/ja/documentation/webdriver/drivers/)
