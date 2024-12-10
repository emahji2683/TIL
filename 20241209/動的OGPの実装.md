# 動的OGPとは
要するに状況に応じて変化するSNSシェア機能

---

## 動的
> 「動的」は「変化するもの」を意味します。

## OGP
要するにSNSでシェアする機能。

>  OGPとは「Open Graph Protcol」の略で、FacebookやTwitterなどのSNSでシェアした際に、設定したWEBページのタイトルやイメージ画像、詳細などを正しく伝えるためのHTML要素です。
# 実装方法

- Gemの追加
- meta_tagsファイルのインストール
- application.html.erbに表示ビューを設定
- application_helperに設定内容を記載
- top_imageの作成・配置
- 外部サービスでの確認

# 実装例

```引用
module ApplicationHelper
  def default_meta_tags
    {
      site: 'サイトネーム',
      title: 'タイトル',
      reverse: true,
      charset: 'utf-8',
      description: 'テキストテキストテキストテキストテキストテキストテキストテキストテキスト',
      keywords: 'キーワード１,キーワード2,キーワード3',
      canonical: request.original_url,
      separator: '|',　
      icon: [
        { href: image_url('logo.png') },
        { href: image_url('top_image.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('top_image.jpg'),# 配置するパスやファイル名によって変更する
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードに変更
        site: '@あなたのツイッターアカウント', # アプリの公式Twitterアカウントがあれば、アカウント名を記載
        image: image_url('top_image.jpg'),# 配置するパスやファイル名によって変更
      }
    }
  end
end
```


# 実装結果

# 課題

# 今後の展開

# 参考資料
- [静的サイトと動的サイトとは？違いや選び方を解説](https://ja.wix.com/blog/2023/08/static-vs-dynamic-website/)
- [OGP画像生成方法まとめ](https://zenn.dev/rikei_ocojo/scraps/6ef8e5e3093a59)
- [metaタグ、OGP設定](https://zenn.dev/goldsaya/articles/ba945b877daa07)
