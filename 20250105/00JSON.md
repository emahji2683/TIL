# JSONとは
> JavaScript Object Notation (JSON) は、構造化データを表現するための標準のテキストベースの形式で、 JavaScript のオブジェクト構文に基づいています。ウェブアプリケーションでデータを転送する場合によく使われます（例えば、複数のデータをサーバーからクライアントへ送信して、ウェブページ上に表示する場合などで、その逆もあります）。

## その他の記述方法と違い
類似の形式としては、XML, CSV等がある。これらと比較してJSONは以下のような特徴がある.

- 表記形式がシンプル 
- 言語に依存しない
- 自由度が高い

## 活用方法
一時データ、永続データの保存。もしくは、APIによるデータの授受に使われる。

- ユーザー生成データの一時保存
- 汎用的データの保存フォーマット
- APIサーバーからの応答形式

# JSONの書き方
- JSONの{}内は、キー(key)と値(value)がペアであり、キーは文字列かつダブルクォーテーション（"）で囲む必要がある。※('')は❌


```
{
    "key1": "value1",
    "key2": "value2",
    "key3": "value3"
}
```

# 使用例

<details>
<summary>JSONコードの例</summary>


```
{
  "squadName": "Super hero squad",
  "homeTown": "Metro City",
  "formed": 2016,
  "secretBase": "Super tower",
  "active": true,
  "members": [
    {
      "name": "Molecule Man",
      "age": 29,
      "secretIdentity": "Dan Jukes",
      "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
    },
    {
      "name": "Madame Uppercut",
      "age": 39,
      "secretIdentity": "Jane Wilson",
      "powers": [
        "Million tonne punch",
        "Damage resistance",
        "Superhuman reflexes"
      ]
    },
    {
      "name": "Eternal Flame",
      "age": 1000000,
      "secretIdentity": "Unknown",
      "powers": [
        "Immortality",
        "Heat Immunity",
        "Inferno",
        "Teleportation",
        "Interdimensional travel"
      ]
    }
  ]
}
```

</details>

# 参考文献
- [階層構造 JSONの書き方](https://qiita.com/yoshiaki1973/items/d7e1db5b6018f48a9692)
- [JSONとは？特徴やメリット、基本文法などを分かりやすく解説](https://career.levtech.jp/guide/knowhow/article/895/)
- []()
- []()
- []()

