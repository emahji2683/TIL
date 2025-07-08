# 経緯
卒業制作において、美術館・レビューページの要素がかなり多いのでpaginationを実装することにした。

## paginationとは
今回の場合でいえば、要素を複数ページに分割して、ページ番号と対応をつけること。

> ページネーション（pagination）とは、ページを割り振り、番号を付けるプロセスや、その方法を指します。印刷物やWebページなど、さまざまな場面で使用されます。

# 概要
gemのkaminariを用いて実装する。

## 処理の原理
- DBより取得した要素をコントローラーのpageメソッドにより、ページごとに分割している。
- その後、分割された要素をそれぞれview上で表示している。

# 実装方法
## 概要
gem(kaminari)をインストールする。
その後、コントローラーにオブジェクト全体をページごとに分割するメソッドを記載する。
- gem(kaminari)のインストール
- ページごとに分割するメソッド
    - ページ変数を受け取る
    - 表示数を指定する
- view上のpaginarionオブジェクトの表示形式を日本語に

## コード
page(params[:page])メソッドを表示するオブジェクトに対して記載している。

<details>
<summary>controller</summary>

```
  def index
    @reviews = Review.all.page(params[:page])
  end
```

</details>

configファイルには、ページごとの要素の表示数を記載している。
<details>
<summary>config</summary>

```
Kaminari.configure do |config|
  config.default_per_page = 12
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
```

</details>

<details>
<summary>views</summary>

```
<div class="join flex justify-center mb-4">
  <%= paginator.render do -%>
    <nav class="pagination" role="navigation" aria-label="pager">
      <%= first_page_tag unless current_page.first? %>
      <%= prev_page_tag unless current_page.first? %>
      <% each_page do |page| -%>
        <% if page.display_tag? -%>
          <%= page_tag page %>
        <% elsif !page.was_truncated? -%>
          <%= gap_tag %>
        <% end -%>
      <% end -%>
      <% unless current_page.out_of_range? %>
        <%= next_page_tag unless current_page.last? %>
        <%= last_page_tag unless current_page.last? %>
      <% end %>
    </nav>
  <% end -%>
</div>
```

```
<%= link_to page, url, class: "join-item btn #{'btn-active' if page.current?}", remote: true, rel: page.rel %>
```

</details>

<details>
<summary>ja</summary>

```
  views:
    pagination:
      previous: "前へ"
      next: "次へ"
      last: "最後"
      first: "最初"
```

</details>

# 参考資料
- [【Rails初心者】ページネーションを実装して自分好みにデザインを変える #Ruby - Qiita](https://qiita.com/rio_threehouse/items/313824b90a31268b0074)
- [【Rails】kaminari&ransackでページネーションと検索機能を実装 #Ruby - Qiita](https://qiita.com/niwa1903/items/809a26fed8a962851417)
- [【Rails】gem 'kaminari' と Tailwind CSS + daisyUI でページネーションをカスタマイズする #Gem - Qiita](https://qiita.com/yuki31100725/items/f8f3ddeaa990de342d11)
