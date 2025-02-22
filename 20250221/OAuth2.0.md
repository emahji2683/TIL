# OAuth2.0とは
OAuthは、OmniAuthenticationの略で「あらゆる認証」という和訳となる。

# 前提知識
## CSRF攻撃とは
> エンドユーザーに認証をすでに付与しているWebアプリケーション内で望ましくないアクションを実行させる攻撃を指します。
※エンドユーザー: その商品やサービスを実際に使う人のこと。

## credentials.yml.enc
秘匿情報の設定ファイルのこと、master.keyによって復号化される(暗号化の逆)。
> credentials.yml.encは秘匿情報の設定ファイル

## master.key
master.keyは、credential.yml.encを復号化するのに使われるファイル。よって、これが流出するとmaster.keyの中身が復号化され、情報が流出してしまうため、Github等にpushしてはならない。このために、.gitigonoreに追加し、リモートにプッシュされないようにする。


# 使用方法
- コンソールからの登録
OmniAuthを使用するアプリケーションのURLを登録し、クライアントID, クライアントシークレットを得る。

- Gemの導入
railsの関連Gemをインストールする。

- credentialの設定
クライアントID, シークレットをcredentialに保存する。

- Configの設定
credentialで設定した、ID、シークレットをRailsで読み込む。

- UsersテーブルへのOAuthカラムの追加(migration)
OAuthに使用するカラムをUsersテーブルに追加する。

- ルートの設定
- モデルの編集
Userモデルに、googleで認証を行うことを明示する。

- コントローラーの作成
- ビューの作成

# 具体の使用


# 使用結果

# 参考資料
- [CSRF（Cross Site Request Forgery）とは？ | フォーティネット](https://www.fortinet.com/jp/resources/cyberglossary/csrf)
- [Rails 7 × Googleログイン – omniauth-google-oauth2で簡単OAuth認証](https://zenn.dev/shunjuio/articles/b9ffb6565b7409)
- [【Rails7】Multi Environment Credentialsで秘匿情報を管理する方法 #Ruby - Qiita](https://qiita.com/joinus_ibuki/items/3a0d264abe510bfdd98a)
- [エンドユーザとは｜「分かりそう」で「分からない」でも「分かった」気になれるIT用語辞典](https://wa3.i-3-i.info/word12311.html)
- [[Rails]deviseとomniauthによるgoogleログイン](https://zenn.dev/redheadchloe/articles/81dec8a2ba5e4a)
