# 動的OGPとは
要するに状況に応じて変化するSNSシェア機能

---

## 動的
> 「動的」は「変化するもの」を意味します。

## OGP
要するにSNSでシェアする機能。

>  OGPとは「Open Graph Protcol」の略で、FacebookやTwitterなどのSNSでシェアした際に、設定したWEBページのタイトルやイメージ画像、詳細などを正しく伝えるためのHTML要素です。
# 実装方法
「metaタグ、OGP設定」を参考にタスクを作成。

- [ ] Gemの追加
- [ ] meta_tagsファイルのインストール
- [ ] application.html.erbに表示ビューを設定
- [ ] application_helperに設定内容を記載
- [ ] top_imageの作成・配置
- [ ] 外部サービスでの確認

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
動的OGPの実装はできた。
アドオンについては、firefox用のアドオンを使用してlocalhost上のOGPを検証した。

[参考にしたサイト](https://zenn.dev/yoshiki105/articles/eb093bf603e728)


<details>
<summary>railsコマンド</summary>

```
rails g meta_tags:install
```
</details>

<details>
<summary>app/views/layouts/application.html.erb</summary>

```
<!DOCTYPE html>
<html>
  <head>
    <title>MetaTagsApp</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>
    <!-- ↓ここに追加↓ -->
    <%= display_meta_tags(default_meta_tags) %>
  </head>
```

</details>


<details>
<summary>application_helper.rb</summary>


```
module ApplicationHelper
  def default_meta_tags
    {
      site: 'ArtVibe',
      title: 'こんな美術館に行きました',
      reverse: true,
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: 'ページの説明',
      keywords: 'ページキーワード',   #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
                                 { href: image_url('favicon.ico') },
                                 { href: image_url('icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'ArtVibe',
        title: '感想',
        description: '楽しかったです', 
        type: 'website',
        url: request.original_url,
        image: image_url('icon.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      }
    }
  end
end
```

</details>

# 課題

# 今後の展開

# 参考資料
- [静的サイトと動的サイトとは？違いや選び方を解説](https://ja.wix.com/blog/2023/08/static-vs-dynamic-website/)
- [OGP画像生成方法まとめ](https://zenn.dev/rikei_ocojo/scraps/6ef8e5e3093a59)
- [metaタグ、OGP設定](https://zenn.dev/goldsaya/articles/ba945b877daa07)
- [RailsでSEO対策の定番gemをさらに使いこなそう！「meta-tags」と「gretel」](https://codezine.jp/article/detail/11253)
- [【超簡単！】RailsアプリでOGPを動的に変更する方法](https://qiita.com/suzuyu0115/items/7f83f84b640640b7e498)
- [RailsOGPの設定方法と、Local環境での確認方法meta-tags](https://zenn.dev/yoshiki105/articles/eb093bf603e728)
