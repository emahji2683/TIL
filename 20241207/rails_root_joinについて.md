
# Rails.root.joinとは
Rails.root.joinは、Railsフレームワークでよく使用されるメソッドで、アプリケーションのルートディレクトリを基点としてファイルやディレクトリのパスを動的に生成するために使います。

## 使用方法

```
path = Rails.root.join('フォルダ名', 'ファイル名')
```

## 使用例

```
temp_file = Rails.root.join('tmp', 'uploads', 'file.txt')
File.write(temp_file, 'Temporary data')
```

