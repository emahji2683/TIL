# turbo_streamとは
要するにページの一部分をリアルタイム更新できるメソッド。
> Turbo Streamsは、リアルタイムで複数のHTML要素を同時に更新する機能を持っています。 この技術は、WebSocketやServer-Sent Events (SSE) と組み合わせることで、リアルタイムでのデータ更新が可能になります。

# .turbo_stream.erbとは
TurboStreamにより、更新する要素を記述するファイル。
> Turbo Streamを使って非同期通信を行う際、更新する要素の情報を書いておくファイルです。

以下の通り、

```
<%= turbo_stream.append "comments_list", partial: "comments/comment", locals: { comment: @comment } %>
<%= turbo_stream.update "comments_count", Comment.count %>
```

