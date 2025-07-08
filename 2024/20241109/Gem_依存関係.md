# Gemの依存関係

Gemの依存関係が原因でDupilicated(重複)のエラーが発生した。


```
group :production do
  gem 'pg', '~> 1.1'
end

group :development, :test do
  gem 'pg', '~> 1.1'
end
```


