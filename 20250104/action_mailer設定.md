
# コード

```
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                  587,
    domain:               ENV['APPLICATION_URL'],
    user_name:            ENV['GOOGLE_MAIL_ADDRESS'],
    password:             ENV['GOOGLE_APPLICATION_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto:  true
  }
```

## :address

>:address: リモートのメールサーバーを指定します。デフォルトの"localhost"設定から変更します。

## authentication:
> :authentication: メールサーバーで認証が要求される場合は、ここで認証の種類を指定します。:plain、:login、:cram_md5のいずれかのシンボルを指定できます。

## メールクライアントとは
>電子メールクライアント（でんしメールクライアント、英: mail user agent、MUA、メールユーザエージェント）とは、電子メールを送受信し管理するためのアプリケーションソフトウェア。 
<br>
[電子メールクライアント](https://ja.wikipedia.org/wiki/%E9%9B%BB%E5%AD%90%E3%83%A1%E3%83%BC%E3%83%AB%E3%82%AF%E3%83%A9%E3%82%A4%E3%82%A2%E3%83%B3%E3%83%88)

## SMTPサーバーとは
> SMTPサーバはSMTPを使いメールの送受信を行っているサーバを指します。 
> SMTPは「Simple Mail Trancefar Protocol」の頭文字を繋げた言葉で、メールの送受信を行うプロトコルのことを指します。


## HELOコマンドとは
メールクライアントがSMTPサーバーに接続する際に使用される。

- [ネットアテストSMTPとは？ わかりやすく10分で解説-SMTPとは？ わかりやすく10分で解説](https://www.netattest.com/smtp-2023_mkt_tst)

## :enable_starttls_auto:

> :enable_starttls_auto: 利用するSMTPサーバーでSTARTTLSが有効かどうかを検出し、可能な場合は使います。デフォルト値はtrueです。





>    :address: リモートのメールサーバーを指定します。デフォルトの"localhost"設定から変更します。<br>
>    :port: 使うメールサーバーのポートが25番でない場合は（めったにないと思いますが）、ここで対応できます。<br>
>    :domain: HELOドメインの指定が必要な場合に使います。<br>
>    :user_name: メールサーバーで認証が要求される場合は、ここでユーザー名を設定します。<br>
>    :password: メールサーバーで認証が要求される場合は、ここでパスワードを設定します。<br>
>    :authentication: メールサーバーで認証が要求される場合は、ここで認証の種類を指定します。:plain、:login、:cram_md5のいずれかのシンボルを指定できます。<br>
>    :enable_starttls: SMTPサーバーにSTARTTLSで接続します（サポートされていない場合は失敗します）。デフォルト値はfalseです。<br>
>    :enable_starttls_auto: 利用するSMTPサーバーでSTARTTLSが有効かどうかを検出し、可能な場合は使います。デフォルト値はtrueです。<br>
>    :openssl_verify_mode: TLSを使う場合、OpenSSLの認証方法を設定できます。これは、自己署名証明書やワイルドカード証明書が必要な場合に便利です。OpenSSLの検証定数である:noneや:peerを指定することも、OpenSSL::SSL::VERIFY_NONE定数やOpenSSL::SSL::VERIFY_PEER定数を直接指定することもできます。<br>
>    :ssl/:tls: SMTP接続でSMTP/TLS（SMTPS: SMTP over direct TLS connection）を有効にします。<br>
>    :open_timeout: コネクション開始の試行中の待ち時間を秒で指定します。<br>
>    :read_timeout: read(2)呼び出しのタイムアウトを秒で指定します。<br>

# 参考資料
- [「SMTPサーバ」を分かりやすく解説！構築する際の注意点も紹介します](https://blastmail.jp/blog/mail-delivery/smtpserver)
- [Rails アプリケーションの設定項目](https://railsguides.jp/configuring.html#action-mailer%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B)
- []()
