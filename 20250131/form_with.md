# form_withとは
要するに、HTMLのform要素を作成するヘルパーメソッド。

> form_withとは、railsで情報を送信するためのヘルパーメソッドです。 form_withを使うことにより、簡単に入力フォームに必要なHTMLを作成することができます。

# form(HTML)とは
端的にいうとGETメソッドはサーバーからデータを取り出すメソッド。POSTはデータを送信するメソッド。

## HTTPメソッドとは
> Webでは、クライアントコンピュータのブラウザから送信される HTTPリクエスト に従って、サーバの処理が行われます。クライアントから発信されるHTTPリクエストは、どのリソースに対して何をしたいかを指示する必要があります。

## クエリパラメータとは何か？
> 「クエリパラメータ」というのは、さまざまな情報をWebサーバーに伝えるためにURLに付け加える情報だ。 

## GETメソッドとは
ページ(リソース)を取得するためにクライアントからWEBサーバーに送られるメソッド。URLの後ろにクエリパラメーターを指定して送信される。

> GET（GETメソッド）とは、HTTP通信でWebブラウザ等のクライアントからWebサーバへと送られる、HTTPリクエストの一種です。基本的に、Webサーバから情報を取り出す（GET）するために使用されます。

以下の例では、``?submitted-name=パラメーター値``のようなクエリが送信される。
```
<form method="get">
  <label>
    Name:
    <input name="submitted-name" autocomplete="name" />
  </label>
  <button>Save</button>
</form>
```

# form_withの具体例


```
<form action="/search" accept-charset="UTF-8" method="get">
  <label for="query">Search for:</label>
  <input type="search" name="query" id="query">
  <input type="submit" name="commit" value="Search" data-disable-with="Search">
</form>
```
