# RESTの原則
和訳すると、「表現状態の転送」。クライアントとサーバー間で「リソースの状態（＝データ）」を「表現（＝JSONやXML）」という形でやりとりする際の設計思想とのこと。
要するになんかをサーバー・クライアント間でやり取りする時の設計思想。
> REST（REpresentational State Transfer）は、Webサービスの設計思想の一つです。

# 構成要素
以下の4点。要約すると、全てのリソースはURLから取得でき、それぞれの取引を独立させる。また、このやり取りの基盤となる情報には他のリソースへのURLを記載することで関連付けを行う。また、このリソースの操作(CRUD)は統一的な方式で行う。
1. アドレス可能性 (Addressability)
2. ステートレス性 (Stateless)
3. 接続性 (Connectability)
4. 統一インターフェース (Uniform Interface)

# 参考資料
https://qiita.com/185shingeki/items/ce01ee915504b8601193
