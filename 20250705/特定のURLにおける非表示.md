# 経緯
卒業制作を行う中で、トップページおいては特定の要素を表示しないようにした。

# 前提知識
## current_page?
現在ユーザーがいるページが引数と一致する場合、真偽値を返すメソッド。
```
current_page?(URL等)
```

# 方法
現在表示しているページがroot_pathであればtrueを返すようになっている。unlessであるのでtrue(条件に当てはまる場合、renderの中のページが表示されない。

```
    <% unless current_page?(root_path) %>
      <%= render 'layouts/footer' %>
    <% end %>
```

# 参考資料
- [RailsコンソールでパスのURLを確認する #Ruby - Qiita](https://qiita.com/morioka1206/items/c65267bfea1a13920059)
- [[rails]navbarやヘッダーをTOPページのみ非表示にする #Ruby - Qiita](https://qiita.com/piya_study/items/0b6218bdc8d39a0cae7c)
