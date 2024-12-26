# 最初に
画面の遅延読み込み機能をstimulusで手軽に実装できる方法を見つけましたので、共有します。卒業制作等にお役立てください。

# 経緯
卒業制作において、OpenAIAPIによる施設のレコメンド機能を実装をしていたところ、API読み込み時間が長いため、待機画面を設けユーザービリティを高めるようとしていた。

# 課題
当初、上記の機能をstimulus+javascriptをで実装しようとしたが、実装が複雑になり断念。そこで、代替案としてstimulusのパッケージを使用することで実装した。

# @stimulus-components/content-loader
読み込みに時間がかかるビューを表示するまで、待機画面を表示することができる。

# 実装概要
## 前提条件
バンドラー: esbuild

## 流れ
実装の概略の流れを以下に示す。

- yarnによるパッケージの導入
- app/javascript/controllers/index.jsへパッケージの記載
- 諸設定
    - レンダリングするビューの指定
    - 読み込み時間等の設定

# 実装例

各ソースコードの内、主要な機能に関連するものは、以下の通り。
``app/views/index.html.erb``: 待ち時間を表示するHTML
``index.html.erbの設定部分に記載するビュー``:遅延読み込みの対象のHTML 

<details>
<summary>全コード</summary>
> yarn
```
yarn add @stimulus-components/content-loader 
```

> app/javascript/controllers/index.js
```
import { Application } from '@hotwired/stimulus'
import ContentLoader from '@stimulus-components/content-loader'

const application = Application.start()
application.register('content-loader', ContentLoader)
```
> app/controllers/posts_controller.rb
```
class PostsController < ApplicationController
  def comments
    render partial: 'posts/comments', locals: { comments: @post.comments }
  end
end
```
> config/routes.rb
```
Rails.application.routes.draw do
  get :comments, to: 'posts#comments'
end
```
> app/views/index.html.erb
```
<div
  data-controller="content-loader"
  data-content-loader-url-value="<%= comments_path %>"
  data-content-loader-lazy-loading-value=""
  data-content-loader-lazy-loading-root-margin-value="30px"
  data-content-loader-lazy-loading-threshold-value="0.4"
>
  <i class="fas fa-spinner fa-spin"></i>
  Loading recommended museums...
</div>
```
>posts/_comments.html.erb
```
任意
```
</details>

# 実装結果
基本的には上記と同じ実装を行なった。

# 参考資料
[公式Doc](https://www.stimulus-components.com/docs/stimulus-content-loader)
