# 経緯
stimulusによって、画面の遅延読み込みを実装しようとしていたが、画面が反応しない事象が発生していた。

# 想定される課題
- esbuild前提での初期設定ができていない
- jsがプレコンパイルされておらず、過去のver.のままである


# 解決策
1. esbuild前提での初期設定ができていない
webpacker, importmap等々バンドラーツールによって、実装方法が異なることに留意する。

``コマンド``
```
yarn add @hotwired/stimulus
```

``app/javascript/application.js ``
```
// app/javascript/application.js
import { Application } from "@hotwired/stimulus";
import HelloController from "./controllers/hello_controller";

const application = Application.start();
application.register("hello", HelloController);
```


``app/javascript/controllers/hello_controller.js``
```
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello, Stimulus!";
  }
}
```

2. jsがプレコンパイルされておらず、過去のver.のままである
以下のコマンドを入力することで解決した。clobberを行った後、jsファイルを再びビルドする必要がある(さもなければ、buildファイルがないとのエラーが発生する)。

``コマンド``
```
bin/rails assets:clobber
bin/rails assets:precompile
docker compose restart
```
## 対応方針
- bin/devに上記のコマンドを追記することによって、自動でclobber, precompileできるようにした。

<details>

<summary>コード一覧</summary>
```
```

</details>



# 参考文献

[chatGPTからの回答](https://chatgpt.com/share/676924b2-e5c4-8003-9091-f732c7f45a0e)
[【Rails7】Stimulus入門！ | 概要 ~ 使い方まで詳しく解説](https://blog.to-ko-s.com/stimlus-introduce/)
