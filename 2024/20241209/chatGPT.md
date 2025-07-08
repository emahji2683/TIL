# ChatGPT API

【API公式】https://platform.openai.com/docs/quickstart

【価格】https://openai.com/api/pricing/

# 基本設定の流れ（Railsの場合）

## 1. Open AI APIプラットフォームにログイン

【公式】https://openai.com/api/

## 2. APIキーを取得

以下よりAPIキーを取得する。

https://platform.openai.com/settings/organization/general

<aside>
💡

新しく生成するAPIキーの名称を付けて「Create new secret Key」を選択すると、APIキーが発行されます。***このキーは一度だけ表示され、改めて確認することはできないので、必ず保存しましょう。***コピーを忘れた場合は、古いキーを削除し、新しいキーを発行して使います。

https://aismiley.co.jp/ai_news/what-is-the-chatgpt-api/

</aside>

APIキーは2種類存在する。（2024年10月29日時点）

- 種別について
    
    【種別説明】https://platform.openai.com/docs/api-reference/api-keys
    
    > The OpenAI API uses API keys for authentication. You can create API keys at a user or service account level. Service accounts are tied to a "bot" individual and should be used to provision access for production systems. Each API key can be scoped to one of the following,
    > 
    > 1. **Project keys** - Provides access to a single project (**preferred option**); access [**Project API keys**](https://platform.openai.com/settings/organization/general) by selecting the specific project you wish to generate keys against.
    > 2. **User keys** - Our legacy keys. Provides access to all organizations and all projects that user has been added to; access [**API Keys**](https://platform.openai.com/account/api-keys) to view your available keys. We highly advise transitioning to project keys for best security practices, although access via this method is currently still supported.
    
    ↓
    
    要は
    
    - Project keys（**こちらの方が推奨**）
        - 1つのプロジェクトへのアクセス
        - 要は、プロジェクトごとの管理キー
    - User keys
        - 従来のキー
        - 最高のセキュリティプラクティスのために、プロジェクトキーに移行することを強くお勧めします。とのこと
        - ユーザーごとのキー管理

## 3. クレカ設定

以下より設定

https://platform.openai.com/settings/organization/billing/overview

## 4. `Gemfile`にgemをinstallする

`Gemfile`に[ruby-openai gem](https://github.com/alexrudall/ruby-openai)を追加

以下のように記述

```ruby
gem "ruby-openai"
```

↓

追加後`bundle install` 

```bash
bundle install
```

## 5. アクセスキーを設定

先ほど発行した秘密キーを環境変数に設定する。

`.env`に追記

```ruby
OPENAI_ACCESS_TOKEN="てめぇのさっき発行したopenai_api_keyだよ"
```

## 6. 使用可能なように設定を変更

`config/initializers/openai.rb` を以下のように記述

```ruby
OpenAI.configure do |config|
  config.access_token = ENV.fetch("OPENAI_ACCESS_TOKEN")
end
```

## 7. クラスを作成し、その中でOpenAIのAPIを利用するように

例：`app/services/chat_gpt_service.rb` という名前で作成した場合

```ruby
class ChatGptService
  require 'openai'

  def initialize
    @openai = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_ACCESS_TOKEN"))
  end

  def chat(prompt)
    response = @openai.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required. # 使用するGPT-3のエンジンを指定
        messages: [{ role: "system", content: "You are a helpful assistant. response to japanese" }, { role: "user", content: prompt }],
        temperature: 0.7, # 応答のランダム性を指定
        max_tokens: 200,  # 応答の長さを指定
      },
      )
    response['choices'].first['message']['content']
  end
end
```

各項目的に設定

- **messages**

基礎的な部分で使用するであろうと思うroleは以下の３つ
system：役割、設定、前提などの入力に使用
user：ユーザの入力
assistant：AIからの出力
単純に使用したい場合にはroleをuserにしてcontentを設定して使えば良い

## 以下は検証例

- コントローラーの作成
    
    ```racket
    rails g controller openai/speak
    ```
    
- show.html.erb
    
    ```racket
    <div class="flex flex-col items-center justify-center py-6 w-full h-full text-blue-900">
      <div class="max-w-4xl w-full space-y-8 h-full">
        <div id="conversation" class="space-y-4 p-4 rounded overflow-y-auto">
        </div>
        <form id="text_form" class="flex items-center px-2 py-1 border-t border-gray-200 bg-white text-blue-500">
          <label for="file_input" class="cursor-pointer inline-block relative">
            <svg class="w-6 h-6 fill-current text-gray-900 transition-colors duration-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
            <path d="M364.2 83.8c-24.4-24.4-64-24.4-88.4 0l-184 184c-42.1 42.1-42.1 110.3 0 152.4s110.3 42.1 152.4 0l152-152c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-152 152c-64 64-167.6 64-231.6 0s-64-167.6 0-231.6l184-184c46.3-46.3 121.3-46.3 167.6 0s46.3 121.3 0 167.6l-176 176c-28.6 28.6-75 28.6-103.6 0s-28.6-75 0-103.6l144-144c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-144 144c-6.7 6.7-6.7 17.7 0 24.4s17.7 6.7 24.4 0l176-176c24.4-24.4 24.4-64 0-88.4z"/>
            </svg>
            <input type="file" id="file_input" class="hidden">
          </label>
          <input type="text" placeholder="入力してください" id="user_input" class="flex-1 px-3 py-2 border rounded border-gray-300 focus:border-blue-500 focus:outline-none focus:ring">
          <button id="button_post" class="px-4 py-2 bg-green-500 text-white rounded-md transition duration-300 ease-in-out hover:bg-green-600 focus:outline-none focus:ring focus:ring-green-200 ml-2">送信</button>
        </form>
      </div>
    </div>
    
    <script>
      const button_post = document.getElementById('button_post');
      button_post.addEventListener('click', function(event) {
        event.preventDefault();
    
        const formText = document.querySelector("#user_input");
        if (formText.value.trim() === "") {
          return;
        }
    
        const url = "<%= openai_speak_path('json') %>?user_input=" + formText.value;
        const postOptions = {
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          method: "GET"
        };
    
        fetch(url, postOptions)
          .then(response => response.json())
          .then(item => {
            const list = document.getElementById("conversation");
    
            const inputHTML = `
              <div class="text-right flex items-end justify-end space-x-2">
                <div class="chat-bubble bg-primary text-primary-content">
                  <span>${formText.value}</span>
                </div>
                <div class="icon-container w-8 h-8 flex-shrink-0">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="w-full h-full"><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                </div>
              </div>`;
            list.insertAdjacentHTML("beforeend", inputHTML);
    
            const responseHTML = `
              <div class="text-left flex items-start space-x-2">
                <div class="icon-container w-8 h-8 flex-shrink-0">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" class="w-full h-full"><path d="M320 0c17.7 0 32 14.3 32 32V96H472c39.8 0 72 32.2 72 72V440c0 39.8-32.2 72-72 72H168c-39.8 0-72-32.2-72-72V168c0-39.8 32.2-72 72-72H288V32c0-17.7 14.3-32 32-32zM208 384c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H208zm96 0c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H304zm96 0c-8.8 0-16 7.2-16 16s7.2 16 16 16h32c8.8 0 16-7.2 16-16s-7.2-16-16-16H400zM264 256a40 40 0 1 0 -80 0 40 40 0 1 0 80 0zm152 40a40 40 0 1 0 0-80 40 40 0 1 0 0 80zM48 224H64V416H48c-26.5 0-48-21.5-48-48V272c0-26.5 21.5-48 48-48zm544 0c26.5 0 48 21.5 48 48v96c0 26.5-21.5 48-48 48H576V224h16z"/></svg>
                </div>
                  <div class="chat-bubble text-primary-content bg-secondary">               <span>${item.text}</span>
                  </div>
              </div>`;
            list.insertAdjacentHTML("beforeend", responseHTML);
            formText.value = "";
            list.scrollTop = list.scrollHeight;
          })
          .catch(error => console.error('Error:', error));
      });
    </script>
    ```
    
- route.rb
    
    ```racket
      namespace :openai do
        get 'speak/', to: 'speak#generate_text'
        get 'speak/show', to: 'speak#show'
      end
    ```
    

# 参考リンク

- [](https://www.togatta.co.jp/Blogs/ml5fofa1vzwr/)
- https://zenn.dev/code_journey_ys/articles/75b8b136dc53ec
- https://qiita.com/mokio/items/6e65ff8572f303c18750
- https://qiita.com/Marusoccer/items/bda01058a365bdd68dba

---
