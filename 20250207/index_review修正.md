# 現状の課題
- 画面端の余白がない
- レビュー項目ごとの区切り線がない
- 評価がない場合の表記が0となっている
- 詳細ページボタンが英語
- 展示会がわからない場合の表記は？
- タグの上に仕切り線を入れる

# 対応方針
## 画面端の余白がない
美術館の一覧(museum)と比較して調整する(index.html.erb)

## レビュー項目ごとの区切り線がない
美術館の一覧画面を参考にしてとそれぞれのパーシャルの中に区切り線を入れる

## 評価がない場合の表記が0となっている
ビュー上で評価なしと表示されるように条件分岐を挿入する

## 詳細ページボタンが英語
単純に書き換える

## 展示会がわからない場合の表記は？
チェックボックスで不明かどうかを入力できるようにする。

## タグの上に仕切り線を入れる
daisyUIのdivederを入れる。

# 対応結果
デザイン周りについては、説明を割愛。

## 展示会がわからない場合の表記は？
stimulusを用いて、チェックボックスをオンにした場合、inputにテキストを追加するようにした。
target: textarea, checkbox
action: toggle

<details>

<summary>/app/javascript/controllers/application.js</summary>

```
 import { Application } from "@hotwired/stimulus"
 import { Autocomplete } from "stimulus-autocomplete"
 import ContentLoader from '@stimulus-components/content-loader'
+import ReviewController from "./review_controller"

 const application = Application.start()
 application.register('content-loader', ContentLoader)
 application.register("autocomplete", Autocomplete)
+application.register("review", ReviewController)
```

</details>  

<details>

<summary>/app/views/reviews/_form.html.erb</summary>

```
-<%= form_with(model: [@museum, review]) do |form| %>
+<%= form_with(model: [@museum, review], data: { controller: "review" }) do |form| %>
   <div class="mt-2">
-    <%= form.text_field :exhibition, class: "input input-bordered flex items-center gap-2
 w-full", placeholder: Review.human_attribute_name(:exhibition) %>
+    <%= form.text_field :exhibition, id: "review_textarea",
+      class: "input input-bordered flex items-center gap-2 w-full",
+      placeholder: Review.human_attribute_name(:exhibition),
+      data: { review_target: "textarea" } %>
   </div>
+
+  <label class="mt-2 flex items-center space-x-2">
+    <input type="checkbox" class="checkbox predefined-checkbox"
+      data-action="review#toggle"
+      data-review-target="checkbox">
+    <span>展示会が分からない・不明</span>
+  </label>
+
 
```

</details>  

<details>

<summary>app/javascript/controllers/review_controller.js</summary>

```
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textarea", "checkbox"]

  toggle(event) {
    if (event.target.checked) {
      this.textareaTarget.value = "展示会が分からない・不明";
      this.textareaTarget.readOnly = true;
      this.textareaTarget.style.backgroundColor = "#d3d3d3";
      this.textareaTarget.style.color = "#696969";
    } else {
      this.textareaTarget.value = "";
      this.textareaTarget.readOnly = false;
      this.textareaTarget.style.backgroundColor = "";
      this.textareaTarget.style.color = "";
    }
  }
}
```

</details>  

## タグの上に仕切り線を入れる
daisyUIのdivederを入れる。

# 参考資料
- [Stimulus 3: リアルなものを構築する #Ruby - Qiita](https://qiita.com/kaorumori/items/fa441b10ce38ff86be3c)
- [Stimulus controllerの登録方法の違い #Ruby - Qiita](https://qiita.com/yasu-sg/items/78043d8b28d720f28336)
