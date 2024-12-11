# rakeタスクとは
Rakeタスクは、Rubyのプロジェクトにおいてよく使用されるビルドツールであるRakeを使って、タスクを定義し、自動化するための仕組みです。特にRailsでは、定型的な作業やプロジェクト管理を効率化するためにRakeタスクが標準的に利用されています。

# 作成方法
## namespaceとは
名前空間を指定してタスクをグループ化するもの。

```
namespace :名前 do
end
```

## taskとは
タスク名を定義するもの。

```
task タスク名: : environment  do
end
```

## 作成例

```
namespace :example do
  task hello: :environment do
    puts "Hello, Rake Task!"
  end
end
```

# 使用方法
rake ネームスペース名:タスク名で呼び出す。

