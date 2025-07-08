# 経緯
卒業制作において、Rspecを実装する必要があったのでこの学習を行なった。

# Rspecについて
> RSpecはRuby言語用のテストフレームワークです。「R」はRubyの「R」。「Spec」はテストコードのことを意味します。

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
