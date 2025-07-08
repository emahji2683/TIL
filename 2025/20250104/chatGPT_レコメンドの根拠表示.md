# 経緯
講師から以下の通り、指摘があった。

<details>
<summary>指摘内容</summary>

> Webアプリのレコメンド機能を改めて確認させていただき、ブラッシュアップできそうだったので追加でお伝えさせて頂きますね！
<br>
> 現状、AIといいねを使ったレコメンド機能を実装していただいているかと思いますが、ユーザー視点からだと「どのデータを素にレコメンドされているのかわからない」状態かと思うので、診断機能（Stepフォーム）を追加して、その診断を素にAIに投げてレコメンドしてもらうと技術のアピールにもなり、UXの向上にもなるかと思いました。
</details>

# 対応方針

## レコメンドに用いたデータを明示する
## レコメンドした根拠を記載する。

> ユーザー視点からだと「どのデータを素にレコメンドされているのかわからない」状態かと思うので、診断機能（Stepフォーム）を追加して、その診断を素にAIに投げてレコメンドしてもらうと技術のアピールにもなり、UXの向上にもなるかと思いました。

# 実装結果

## レコメンドに用いたデータを明示する
simulusによるロード時の待っている間にレコメンド機能の概要を表示するようにする。
- ロード画面のサンプルを見つける
- 表示する内容を決める
- 現在の表示内容のブラッシュアップ(ロード中であることを伝える)
- いいねした美術館のへのリンクへのガイドを貼る
- いいねを根拠にchatGPTがレコメンドしていることを伝える
- 画面を実装する

## レコメンドした根拠を記載する。
根拠も同時に出力するようにする。出力カラムの追加。

> /views/recommendations/index.html.erb 
```
<div class="flex flex-col justify-center items-center min-h-screen bg-gray-100">
  <div class="flex flex-col justify-center items-center p-4 bg-white rounded-lg shadow-lg">
    <div
        data-controller="content-loader"
        data-content-loader-url-value="<%= load_content_path %>"
        data-content-loader-lazy-loading-value="true"
        data-content-loader-lazy-loading-root-margin-value="30px"
        data-content-loader-lazy-loading-threshold-value="0.5"
        data-content-loader-load-scripts-value="true"
        class="flex flex-col justify-center items-center"
        >
        <div class="flex items-center">
          <span class="loading loading-bars loading-lg text-4xl"></span>
        </div>
        <body class="flex items-center justify-center min-h-screen bg-gradient-to-b from-white to-blue-50">
          <div class="flex flex-col items-center text-center">
            <!-- ロゴまたはアイコン -->
            <div class="mb-4">
              <img src="logo-placeholder.png" alt="アプリロゴ" class="w-16 h-16">
            </div>

            <!-- メインメッセージ -->
            <h1 class="text-2xl font-semibold text-gray-800">おすすめを準備中...</h1>
            <p class="text-sm text-gray-600 mt-2">
            「いいね」した美術館の情報を基に、ChatGPTがあなたに最適なレコメンドを作成しています。
            </p>


            <!-- ガイドセクション -->
            <div class="mt-8 w-4/5 p-4 bg-white shadow-md rounded-lg">
              <h2 class="text-lg font-medium text-gray-700">「いいね」した美術館</h2>
              <!-- アニメーションスピナー -->
              <ul class="text-sm text-blue-500 mt-2 space-y-1">
                <li>
                  <a href="/museum/1" class="hover:underline">美術館Aへのリンク</a>
                </li>
                <li>
                  <a href="/museum/2" class="hover:underline">美術館Bへのリンク</a>
                </li>
                <li>
                  <a href="/museum/3" class="hover:underline">美術館Cへのリンク</a>
                </li>
              </ul>
            </div>

            <!-- サブメッセージ -->
            <p class="mt-6 text-gray-500 text-xs">
            このプロセスは数秒かかる場合があります。少々お待ちください。
            </p>
          </div>
        </body>
    </div>
  </div>
</div>
```

# 課題

# 今後の展開

# 参考資料
