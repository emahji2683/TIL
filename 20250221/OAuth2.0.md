# OAuth2.0とは

# 前提知識
## CSRF攻撃とは
## credentials.yml.enc
秘匿情報の設定ファイルのこと、master.keyによって復号化される(暗号化の逆)。
> credentials.yml.encは秘匿情報の設定ファイル

## master.key
master.keyは、credential.yml.encを復号化するのに使われるファイル。よって、これが流出するとmaster.keyの中身が復号化され、情報が流出してしまうため、Github等にpushしてはならない。このために、.gitigonoreに追加し、リモートにプッシュされないようにする。


# 使用方法
- コンソールからの登録
- Gemの導入
- Configの設定
- credentialの設定
- ルートの設定
- コントローラーの作成
- ビューの作成


# 具体の使用



# 使用結果

# 参考資料
