# 課題
写真の高さがまちまちになっていて、カードの下端が見切れていた。この高さの違いは、画像サイズの大きさが異なることに起因していた。

# 対策
``object-cover``を用いた。これにより得られる画像の特徴は以下の通り。
- 縦横高さは指定したものになる
- これに対して余白はなし
- 元の画像の縦横比は変わらず、拡大・縮小される
- よって、見切れが生じる。

# 実際のコード
以下の通り実装を行った。画像の横幅は親要素一杯になるようにし、縦幅はカードの高さを揃えるため一定にした。
<details>

<summary>美術館カード</summary>

```
<img class="m-2 object-cover h-60 w-full" src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&amp;photoreference=AUy1YQ1V1aLzl5DnWSrebcnJhsvKaB9ECfVALSomFyiryS0QSrgQQOxia98z-drcqDK8SsHxkEhcQRRxUV9_SrudGjBUFGahmjiDfjHzqP_iQSiSxsu_DXlVh_iR_jQFe0Ae8THb32EKkqOZUAGTGe7lSjftCRvxRdsscBH9wFKP9OnF058Q53RNsXX1&amp;key=AIzaSyDWBB9YjEf3ccVpsIja5HyOPCZ4CUWMqzo" loading="lazy">
```

</details>  

# 結果
画像の高さが一定になることにともなってカード高さも一定となった。
