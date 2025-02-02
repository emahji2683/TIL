# 経緯
卒業制作を行なっている中で、それぞれの投稿についてtwitterでシェアできるようにしたく考えている

# 実装方針
- OGP(helper)にimageオプションを追加する。
- Xシェアボタンの追記

# 実装方法

以下の通り、現在のページのURLと投稿のテキストを投稿できるようにした。

<details>

<summary>reviews/show.html.erb</summary>

```
        <%= link_to "https://twitter.com/share?url=#{ request.url }&text=【テスト】%0a%0a#{ @review.body }、シェアさいこう〜", target: '_blank' do %>
```

</details>  

# 参考資料
- [【超簡単！】RailsアプリでOGPを動的に変更する方法 #Ruby - Qiita](https://qiita.com/suzuyu0115/items/7f83f84b640640b7e498)


