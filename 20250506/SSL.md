# SSLとは
機器の間で暗号化されたデータのやり取りができる、トランスポート層のプロトコル。
> SSL（Secure Sockets Layer）とは、トランスポート層においてでやり取りされる情報を暗号化して安全に送受信する仕組みです。

# 暗号化の方法
## 暗号化とは
データを第３者にとってわからない内容に変換すること。
> データを第三者にとって意味をなさない値に変換することを暗号化といいます。

## 暗号化の種類
SSLに用いる、暗号化方式としては、共通鍵暗号方式と公開鍵暗号方式がある。

暗号化、復号に同じ鍵を使う暗号化方式。
> 共通鍵暗号方式とは、暗号化と復号に同じ鍵を使う暗号方式。この方式では、事前に情報をやりとりする相手と共通鍵を共有しておく必要がある。

## SSL通信の流れ
- クライアントからWEBサーバーへ接続要求
- WEBサーバーからクライアントへSSLサーバー証明書と公開鍵を送信
- クライアントからWEBサーバーへ共通鍵を送付

# サーバー証明書とは
> ウェブサイトの運営者や組織の実在性を確認し、通信データを暗号化するための電子証明書

# 電子証明書とは
> 特定の認証局が発行する電子的な身分証明書 

# 参考資料
- https://college.globalsign.com/ssl-pki-info/ssl-encryptions/
