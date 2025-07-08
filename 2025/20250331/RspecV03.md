# 経緯
卒業制作において、Rspecを実装する必要があったのでこの学習を行なった。

# Rspecについて
> RSpecはRuby言語用のテストフレームワークです。「R」はRubyの「R」。「Spec」はテストコードのことを意味します。

# specの種類
大まかに単体テスト、結合テスト、システムテストの3種類に大別される。

| RSpecで作成するディレクトリ              | Specの種類  | どのテストで使うか           |
|------------------------------------------|-------------|------------------------------|
| spec/view                                | :views      | ビューの単体テスト           |
| spec/models                              | :model      | モデルの単体テスト           |
| spec/controllers                         | :controller | コントローラーの単体テスト   |
| spec/helpers                             | :helper     | ヘルパーメソッドの単体テスト |
| spec/routing                             | :routing    | ルーティングの単体テスト     |
| spec/jobs                                | :job        | ジョブの単体テスト           |
| spec/mailer                              | :mailer     | メーラーの単体テスト         |
| spec/request, spec/integration, spec/api | :request    | 結合テスト                   |
| spec/feature                             | :feature    | システムテスト               |
| spec/system                              | :system     | システムテスト               |
<br>
- [RailsのRSpecで行うべきテストの種類と注意点 #Ruby - Qiita](https://qiita.com/ryouzi/items/4d198eac8df5958ddb1e)

## テストの種類
### 単体テスト
> 特定のモデルの1つのメソッド、関数ごとにテストをする形になります。
> 以下はUserモデルの1つのバリデーションのテストになります。

### 結合テスト
> APIなどで どのURLにどのようなパラメーターを投げたら、どのよなうなレスポンスを返すのか というテストをします。

#### 実践例
結合テストのサンプルを以下に示す。このテストにおいては、以下に示す内容を検証している。
- ユーザーを新しく作成した時レコードの数が増加する。
- showの画面が表示されている。
- ユーザがログイン状態であるか確認する。

```
RSpec.describe "Users signup", type: :request do
  example "valid signup information" do
    get signup_path
    expect {
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    }.to change(User, :count).by(1)
    
    expect(response).to redirect_to(assigns(:user))
    follow_redirect!
    
    expect(response).to render_template('users/show')
    expect(is_logged_in?).to be_truthy
  end
end
```

### システムテスト
システムはユーザーが実際にしよする画面を操作したテスト。この捜査にあたってはcapybaraというブラウザ操作アプリを使用する。
> システムテストはユーザーが実際に利用する画面を操作を再現してのテストになります。この画面に訪れて、このボタンをクリックしたら、ツイート作成画面に遷移して、必須項目を入力して作成ボタンを押すと、DBに記事が1つ作成され、投稿一覧画面が表示される というようなテストを記載します。
> FeatureSpec, SystenSpecのどちらも、RSpecで提供されているE2Eテスト機能です。Feature Specのほうが歴史が長く、古いバージョンのRailsプロジェクトではこちらがよく使われていると思います。

```
describe 'ツイート作成', type: :system do
  describe '通常のユーザーの場合' do
    let!(:article) { create(:user) }

    it 'ツイートを作成することができる' do
      visit tweets_path
      fill_in 'tweet[content]', with: '今日はいいことがあった！'
      click_on 'ツイート新規作成'
      expect(page).to have_current_path(tweets_path)
    end
  end
end
```
#### capybaraとは
> WebブラウザとWebアプリケーションの間で交わされるHTTP通信をエミュレート（模倣）するためのライブラリのことです。特定の要素をクリックした利、フォームから値を入力したり、表示状態を確認したりできる。フューチャスペック(統合テスト)に最適です。


# 使用方法

## モデルのspecファイルを作成する

```
rails g rspec:model review
```

## specファイル内にコードを記載する
Rspecないで使用するコードの意味は以下の通り。
以下の例においては、Taskモデル(describe)のバリデーションの有効性を確認するという(context)に対して、itで個別のテストを定義している
itの具体的な中身については、FactoryBotのbuildメソッドでTaskオブジェクトを作成し、

| コード   | 意味                   | 具体例                                                                        |
|----------|------------------------|-------------------------------------------------------------------------------|
| describe | テストの対象を記述する | describe 'taskモデル（テストの対象）' do                                      |
| context  | テストの条件を記述する | context '値を入れなくてはならないカラムのバリデーションが有効であるか確認する |
| it       | テストの内容を記述する | it '全ての属性の値があれば有効' do                                            |
| expect   | 期待する動作を記述する | expect(task.errors).to be_empty                                               |

| コード | 意味                             | 具体例                                                                        |
|--------|----------------------------------|-------------------------------------------------------------------------------|
| build  | テスト用のオブジェクトを作成する | task = build(:task)                                                           |
|        | テストの条件を記述する           | context '値を入れなくてはならないカラムのバリデーションが有効であるか確認する |

```
  describe 'Taskモデル（テストの対象）' do
    context '値を入れなくてはならないカラムのバリデーションが有効であるか確認する（条件）' do
      it '全ての属性の値があれば有効' do
        task = build(:task)
        expect(task).to be_valid # タスクオブジェクトがバリデーションを通過しているか
        # バリデーション判定後のインスタンスの持つエラーメッセージの配列は空である
        expect(task.errors).to be_empty #　タスクオブジェクトがエラーメッセージを保持していない
      end
```

# 参考資料
- [【rspec】Railsモデルテストの基本 #Ruby - Qiita](https://qiita.com/a-kym/items/1b7b4af1e6d102625562)
- [Rspecテスト](https://zenn.dev/goldsaya/articles/479cf39648e2ca)
- [【RSpec】describe,context,itの使い分けについて - bokuの学習記録](https://boku-boc.hatenablog.com/entry/2021/02/20/172203)
- [Rspec ユーザー登録時の文字制限のテストの書き方](https://teratail.com/questions/242429)
- [RailsのRSpecで行うべきテストの種類と注意点 #Ruby - Qiita](https://qiita.com/ryouzi/items/4d198eac8df5958ddb1e)
- [System SpecとFeature Specは何が違うの？ #Ruby - Qiita](https://qiita.com/shima-zu/items/3eb08662f2da05196ec9)
