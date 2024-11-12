
# deviseについて

deviseとはrailsで作ったwebアプリケーションに簡単に認証機能を実装できるgemのことです。
認証機能と聞くと難しく感じますがようは、login,logout機能のことです。
上記機能を簡易に実装できるのがメリット。
認証機能と合わせて、セキュリティ、パスワードリセット、セッション保存などもできる。

|module | 機能 |
| --- | --- |
|database_authenticatable |	DBに保存するパスワードの暗号化(必須) |
|registerable |	サインアップ処理 |
|recoverable |	パスワードリセット |
|rememberable |	クッキーにログイン情報を保持 |
|trackable |	サインイン回数・時刻・IPアドレスを保存 |
|validatable |	メールアドレスとパスワードのバリデーション |


[rails devise完全入門！結局deviseって何ができるの？](https://www.sejuku.net/blog/13378)
