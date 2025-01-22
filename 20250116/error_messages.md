# 経緯
卒業制作において、バリデーション実行時のエラーメッセージを表示するビューを作成した。

# 実装方針
- レンダリングするビューについては、他のモデルでも援用できるようにすする
- daisyUIのビューを使用して、共通のビューと合わせて表示する。

# 実装結果
<details>

<summary>reviews/index.html.erb, edit.html.erb</summary>

```
<%= render "layouts/shared/error_message", obj: @review %>
```
</details>


<details>

<summary>/views/layouts/shared/_error_message.html.erb</summary>

```
<% if obj.errors.any? %>
  <div role="alert" class="alert" >
    <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        class="stroke-info h-6 w-6 shrink-0">
      <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
    </svg>
    <div style="color: red">
      <h2><%= pluralize(obj.errors.count, "error") %> prohibited this review from being saved:</h2>
      <ul>
        <% obj.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  </div>
<% end %>

```
</details>

# 参考資料
- [【Rails】エラーメッセージを表示させたい！ #Ruby - Qiita](https://qiita.com/vaza__ta/items/45c6b4d8025651e2b6ed)
- [【Rails】エラーメッセージを使い回す #Ruby - Qiita](https://qiita.com/d0ne1s/items/25acf0e70c12042c4c35)
