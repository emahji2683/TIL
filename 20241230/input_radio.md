# input_type="radio"とは
> input要素の radio 型は、一般にラジオグループ、すなわち関連するオプションの組み合わせを示すラジオボタンの集まりです。グループ内でラジオボタンは一つしか同時に選択することができません

# 実装方法

以下の通り実装する。checked属性を記載することにより、デフォルトで選択されているラジオボタンを指定できる。

```
<input type="radio", name="送信データの属性名", value="送信データの値", checked>
```

# 実装例

```
  <div>
    <input type="radio" id="huey" name="drone" value="huey" checked />
    <label for="huey">Huey</label>
  </div>

  <div>
    <input type="radio" id="dewey" name="drone" value="dewey" />
    <label for="dewey">Dewey</label>
  </div>

  <div>
    <input type="radio" id="louie" name="drone" value="louie" />
    <label for="louie">Louie</label>
  </div>
</fieldset>
```

# 参考資料

- [input type="radio"](https://developer.mozilla.org/ja/docs/Web/HTML/Element/input/radio)
