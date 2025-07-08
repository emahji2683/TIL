# 経緯
卒業制作において、投稿ユーザー以外がレビューの削除・編集をでき内容に修正した。

# 実装方法
以下の通りの実装を行った。
- current_userの投稿以外は削除・編集ボタンが表示されないようにする。
- current_userの投稿以外に対しては、destroy!メソッドを使えないようにした。

# 実装結果
以下の通り実装した。
- ifにより、現在ユーザーのidとレビューが持つuser_idが一致する時のみ削除・編集ボタンをレンダリング、destroy!メソッドを行うようにした。

    <details>
    <summary> show.html.erb</summary>

    ```ruby:show.html.erb
    <% if user_signed_in? && current_user.id == @review.user_id %>
    <%= link_to "レビュー編集する", edit_review_path(@review), class: "btn btn-sm m-2" %> 
    <%= button_to "レビューを削除する", @review, method: :delete, class: "btn btn-sm m-2" %>
    <% end %> 
    ```

    </details>

    <details>
    <summary>reviews_controller.rb</summary>

    ```ruby
    if @review.user_id == current_user.id
    @review.destroy!
    end
    ```
    </details>

# 課題

# 今後の展開

# 参考資料
- [[Ruby on rails][アクションdestroy]ユーザーが登録したものをユーザーのみが削除する | 岡田デザインラボ](https://www.okadalabo.com/ruby-on-rails%E3%82%A2%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3destory%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E3%81%8C%E7%99%BB%E9%8C%B2%E3%81%97%E3%81%9F%E3%82%82%E3%81%AE%E3%82%92%E3%83%A6%E3%83%BC/)
