

# yarnによるパッケージの導入
docker compose exec app yarn add daisyui

# tailwind.config.jsの編集

```
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.s'
  ],
  plugins: [
    require('daisyui')
  ]
}
```

# docker compose restart
buildファイルを再生生成する。

[Dockerでrails7 + tailwind + daisyuiの環境構築をする](https://qiita.com/ICU1234/items/4c7c3e974ae290e68792#docker-composeyml)
