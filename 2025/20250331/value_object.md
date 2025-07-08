# value_pbjectとは
Railsにおけるデザインパターンの一つ。この名称のvalue_objectは値を表すオブジェクトです。この値とはドメイン駆動設計手法の概念です。意味としては、同一性を判断できない情報のことを指します。

| 概念           | 概要                                                 | 例         |
|----------------|------------------------------------------------------|------------|
| エンティティ   | あるオブジェクトが持つ値が同じなら同一だと言えるもの | ユーザー   |
| 値オブジェクト | 同一性を判断できない情報                             | 名前、住所 |

# value_objectのメリット
他のクラスで同様のメソッドを使用する際に何度も同じ表現を記述しなくて済む、それに伴って一箇所を変更すれば他にも適用が及ぶ等のメリットがある。

# 参考資料
- [【個人的サーベイ】Railsのデザインパターンについて](https://zenn.dev/adverdest/articles/0aaecc6173b3aa)
- [デザインパターンについて #プログラミング - Qiita](https://qiita.com/hukuryo/items/3bc62e65b402014918c3)
- [Ruby on Railsの人気のあるデザインパターン #DesignPatterns - Qiita](https://qiita.com/vudoan/items/4a70a819f323f7ac524a#service)
- [Railsのデザインパターン: Valueオブジェクト - applis](https://applis.io/posts/rails-design-pattern-value-objects)
