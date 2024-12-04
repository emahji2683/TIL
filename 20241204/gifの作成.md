
# 経緯
githubに修正箇所を動画でアップロードする必要性が生じた。

# 目的
スクリーンショットの動画をgif画像に変換する。

# 方法の概要
minimagikとffmpegを使用する。

- minimagikのインストール
- gifへ変換

# 具体のコード

## minimagikのインストール
```
brew install imagemagick
```

## gifへ変換
```
ffmpeg -i sample.mp4 -an -r 10 %04d.png
convert *.png -resize 40% output_%04d.png
convert output_*.png result.gif  //  gifに変換
```

# 結果

# 参考資料
[GithubのReadmeに荒くないgifを作成から貼り付けまで](https://qiita.com/_kskymst/items/ebeb0c59b603c7224eac)

