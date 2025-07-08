# 課題
現在複数項目でレビューを行なっているが、結果でこの詳細を確認できない。

# 対応方針
- 現在daisyUIのコンポーネントにより実装しており、このコンポーネントは内部的radionボタン形式となっている。
- このことを踏まえて、radioボタンのデフォルト値を動的に表示するようにすることで、値を表示する。

# 対応結果
以下の通り、カラムと値に応じたオブジェクトを生成するコードを追記した
カラムの場合においては、カラム名を配列として与え、それぞれのキーに代入した。
また、それぞれのビューに与えられた、データとraitingの要素が一致する場合checkedにするiif分を実装した

<details>

<summary>index.html.erb</summary>

```
      <% unless params[:action] == 'index' %>
        <div class="w-full mt-2 space-y-4">
          <% { exhibition_rate: :exhibition, museum_design_rate: :museum_design, access_rate: :access, museum_shop_rate: :museum_shop }.each do |key, label| %>
            <div class="rating rating-md rating-half">
              <h1 class="w-60"><%= Museum.human_attribute_name(key) %></h1>
              <% if review[key].present? %>
                <input type="radio" name="review[<%= key %>]" value="0.0" class="rating-hidden" />
                <% (1..10).each do |i| %>
                  <input type="radio" name="review[<%= key %>]" value="<%= i * 0.5 %>" class="mask mask-star-2 mask-half-<%= i.odd? ? '1' : '2' %> bg-primary"
                  <%= 'checked' if review[key] == i * 0.5 %> disabled />
                <% end %>
              <% end %>
            </div>
          <% end %>
        </div>
      <% end %>
```

</details>  

# 参考資料
