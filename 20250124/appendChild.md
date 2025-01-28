# appendChildとは
appendは「加える」という意味。また、特定の親要素の中に要素を追加するメソッド。
> appendChildは、特定の親要素の中に要素を追加するためのメソッドです。要素を指定し、その要素の子要素として、HTMLタグを追加することができます。追加される場所は、親要素の末尾です。
>

# 方法
親要素.appendChild(追加する要素)

# 
- DOMでHTML上の要素を指定
- js上で要素を作成
- 内容を編集
- 作成した要素を追加

```
function appendText() {
  const tabsList = document.getElementById("tabsList");
  const newText = document.createElement('li');
  newText.innerHTML = '追加要素';
  tabsList.appendChild(newText);
}
```

```
<html>
<head>
  <title>Popup</title>
</head>
<body>
  <h1>Hello Add-on!</h1>
  <input type="button" value="追加" onclick="appendText()">
  <ul id="tabsList"></ul>
  <script src="appendChild.js"></script>
</body>
</html>
```
