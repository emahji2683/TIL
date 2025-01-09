
# 経緯
stimulusのコンポーネントにおいてCSSが当たらないという現象が起きていた。
これに対して、assetの削除、プレコンパイルを行うことにより改善されたためこれを自動化するために、bin/devに以下のコードを追記した。

# 具体のコード

> .bin/dev
```
if gem list --no-installed --exact --silent foreman; then
  echo "Installing foreman..."
  gem install foreman
fi

export PORT="${PORT:-3000}"

echo "Clearing and recompiling assets..."
bin/rails assets:clobber
bin/rails assets:precompile

exec foreman start -f Procfile.dev --env /dev/null "$@"
```

