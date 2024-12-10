
# openAIAPIとは
要するにOpenAIのモデルをアプリケーション上で動作させることができるAPI。

> OpenAI APIは、OpenAIが提供する人工知能のAPI（Application Programming Interface）です。このAPIを使用することで、開発者は自然言語処理タスクや他のAI関連のタスクを実行するために、OpenAIのモデルを利用することができます。

# 実装方法
- [x] APIキーの取得
- [x] APIキーを調べる 
- [x] .envへのキーの記載
- [x] ruby-openaiの導入
- [ ] 設定ファイル(openai.rb)を変更
- [x] コントローラーのチューニング    
- [x] コントローラーにAPIのメソッドを記載
- [x] routeの定義
- [x] ビューの作成
- [ ] 料金体系調べる

# 実装方法詳細
[OpenAI公式](https://openai.com/index/openai-api/)

## コントローラーのチューニング    
ENVが読み込まれない？

<details>
<summary></summary>

```
@client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openai, :api_key))
```

</details>


# 実装例

<details>
<summary>route.rb</summary>
   
   ``` 
      namespace :openai do
        get 'speak/', to: 'speak#generate_text'
        get 'speak/show', to: 'speak#show'
      end
```
</details>

<details>
<summary>controller</summary>

```
rails g controller openai/speak
```
</details>

<details>
<summary>show.html</summary>
    
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
</details>

<details><summary>chat_gpt_service.rb</summary>

```
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
</details>

# 実装結果

<details>
<summary>route.rb</summary>
   
   ``` 
      namespace :openai do
        get 'recommend/', to: 'recommend#generate_text'
        get 'recommend/show', to: 'recommend#show'
      end
```
</details>

<details>
<summary>controller</summary>

```
rails g controller openai/recommend
```
</details>

<details>
<summary>show.html</summary>
    
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
</details>

<details><summary>chat_gpt_service.rb</summary>

```
require 'openai'

class RecommendationService
  def initialize(user)
    @user = user
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end

  def recommend_museums
    liked_museums = @user.favorites.joins(:museum).pluck('museums.name')

    prompt = <<~PROMPT
      ユーザーが以下のミュージアムを「いいね」しました:
      #{liked_museums.join("\n")}

      これに基づいて、他のミュージアムやアート関連のおすすめを日本語で提案してください。
    PROMPT

    response = @client.chat(
      parameters: {
        model: "gpt-4",
        messages: [{ role: "system", content: "あなたは有能なレコメンデーションエンジンです。" },
                   { role: "user", content: prompt }],
      temperature: 0.7
      }
    )

    response.dig("choices", 0, "message", "content") || "おすすめが見つかりませんでした。"
  end
end
```
</details>

### パスの設定
以下の内容をappilication.rbに追加することで、serviceコントローラー用のパスを設定できる。
<details>
<summary>ArtVibe/config/application.rb</summary>

```
    config.autoload_paths += %W(#{config.root}/app/services)
```
</details>

# 課題
## 出力精度の向上
美術館以外も抽出されている事象が起きている。

## 文字列の整形
文字列が羅列されていて見ずらい。


# 今後の展開

# 参考資料
- [chatGPT回答結果](https://chatgpt.com/share/6758060c-6b00-8003-b494-7aea2f7ad17d)
- [OpenAI API（オープンエーアイエーピーアイ）](https://www.softbank.jp/biz/solutions/generative-ai/ai-glossary/openai-api/)
