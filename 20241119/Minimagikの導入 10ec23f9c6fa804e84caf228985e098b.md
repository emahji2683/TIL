# Minimagikの導入

- 以下の処理をすることで、minimagikを導入した。
- gem "image_processing", ">= 1.2"をgemに導入。
- 以下をconfig/application.rbに追記

```racket
config.active_storage.variant_processor = :mini_magick
```
- 上記のような認識であったが、さまざまなエラーが起き画像が破損した状態から動かなかった。
-
-

[【Rails】Could not open library 'libvips.so.42'解消法](https://qiita.com/P-man_Brown/items/99afba04ab5af3058e72)
[railsでYou must have ImageMagick or GraphicsMagick installedを解決する](https://qiita.com/masashai/items/11e09408ca204a555f82)
一方で、libvipsについては、環境構築(Dockerfile)段階から入らなくては使えなそう。

https://qiita.com/nagumo01/items/76b97a98e83604150496
https://qiita.com/P-man_Brown/items/99afba04ab5af3058e72
[簡単】Railsでの画像アップロードと表示機能の追加方法](https://qiita.com/soraa24926/items/de57db7c8f716f11662a)
[【Rails6】ImageMagickからlibvipsに移行する](https://qiita.com/yocchan_qiita/items/afdc4d32a6ab8864ddcf)
[Railsの画像まわりのライブラリについて整理する(ActiveStorage, ImageMagick, ImageProcessing,,,)](https://qiita.com/fgem28/items/54c5ca70753f16ef420c)

[Rails7】ActiveStorageの使い方](https://qiita.com/nagumo01/items/76b97a98e83604150496)
[[Ruails]ActiveStorageを使ってアバター機能を実装する方法](https://toaru-kaihatsu.com/user-avatar/)
