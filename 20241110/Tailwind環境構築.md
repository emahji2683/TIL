1. 以下を Gemfile に追加

```
gem "cssbundling-rails"
```
2. bundle install を実行
3. bin/rails css:install:tailwind 実行
4. 以下を package.json の scripts に追加する

```
"build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"
```
