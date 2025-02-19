# ブレークポイントとは
> 画面幅に合わせてCSSを切り替える時に使用する、切り替えポイントのことです。

# tailwindにおけるブレークポイントとは
以下の通りとなっている。
smは大体Macの画面幅よりやや小さいくらい。

```
/* Small (sm) */
@media (min-width: 640px) { /* ... */ }

/* Medium (md) */
@media (min-width: 768px) { /* ... */ }

/* Large (lg) */
@media (min-width: 1024px) { /* ... */ }

/* Extra Large (xl) */
@media (min-width: 1280px) { /* ... */ }
```

# 今回の実装例
以下の通り、画面幅がSmall(sm)より大きい場合、文字サイズを大きくするCSSを実装した。
具体には、sm以下の時、text-sm、sm以上の時、text-2xlとなるように実装した。
これにより、スマホ画面に置いて、表が切れることがなくなった。

```
<td class="<%= 'text-lg sm:text-2xl' if [1, 2, 3].include?(i + 1) %>"><%= museum.likes_count %></td>
          <td class="<%= 'text-sm sm:text-2xl' if [1, 2, 3].include?(i + 1) %>"><%= museum.name %></td>
```

# 参考資料
- [Tailwind CSSについて #tailwindcss - Qiita](https://qiita.com/y-suzu/items/496be157add1eee07274)
- [レスポンシブデザインに必要不可欠なブレイクポイントとメディアクエリとは？ | Drupalブログ | Drupal専門の開発会社 スタジオ・ウミ](https://www.studio-umi.jp/blog/610)

