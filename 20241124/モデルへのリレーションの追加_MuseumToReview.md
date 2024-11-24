## 経緯
卒制アプリを作成する中で、リレーション・アソシエーションの設定をしている。
## 目的
MuseumモデルとReviewモデルの上記を作成する。

## アソシエーション
モデルにアソシエーションを追加する。今回の場合、Museumモデルが１、Reviewモデルが多のアソシエーションとなる。
Userモデルの方には、has_many、reviewモデルの方にはbelongs_toを記載する。具体な記載方法は以下の通り。
- モデル名をシンボルとして記載する。
- メソッド名の後ろには何もつけない。

```
  has_many :モデルの複数形, dependent: :destroy
  belongs_to :モデルの単数系
```


## リレーション
iテーブルの関係性であるリレーションを追加する。具体的には、リレーションを追加するテーブルであるUserテーブルとReviewテーブルに主キーを追加する。

```
docker compose exec app rails g migration AddColumnMuseum_idOfReviews
```

```
t.integer  :museum_id, null:false, default: 0
```

## 流れ
### モデルへのアソシエーションの追加
### 主キーの追加
### データ上の関連付けの追加(controller)

要約すると、対応する親テーブル(@museum)を指定する。
また、二文目においては、現在のログインユーザーのコメントがインスタンスとして指定され、それに対して、newにより末尾に新しいインスタンスが追加される。

```
class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # 投稿詳細ページで渡ってきているpost_idと同じpost_idの投稿をpostへ代入（1）
    @post = Post.find(params[:post_id])
　　# 送られてきたcomment_paramsをログインしているユーザーのものと関連づける（2）
    comment = current_user.comments.new(comment_params)
　　# （1）のpost_idと（2）のpost.idが同じであれば保存する
    comment.post_id = @post.id　
    comment.save
　　#　投稿詳細ページへリダイレクトする。
    redirect_to post_path(@post)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
```
### 実際の実装

現在のユーザーのレビュー一覧(インスタンス)に追加するイメージ。

```
  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

```

### viewの実装


[【Ruby】Railsのアソシエーションとリレーションを理解し、コメント機能を実装](https://zenn.dev/code_journey_ys/articles/f0c28206eb3fb4)

[Ruby on Rails カラムの追加と削除](https://qiita.com/azusanakano/items/a2847e4e582b9a627e3a)
