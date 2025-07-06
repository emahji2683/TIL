# 1. ベースイメージの指定
FROM ruby:3.2

# 2. 作業ディレクトリを設定（以降の操作の基準ディレクトリ）
WORKDIR /app

# 3. 必要なファイルをコピー（ローカル → コンテナ）
COPY . .

# 4. パッケージのインストール（例: Gemfileがある場合）
RUN bundle install

# 5. 実行コマンドを指定（デフォルトの起動内容）
CMD ["ruby", "app.rb"]
