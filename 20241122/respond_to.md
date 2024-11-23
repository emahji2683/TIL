
# POSTリクエストについて
ブラウザからサーバーにデータを送信する方法。データとはフォームに入力された内容等のことを指す。

# respond_toメソッドとは
URLにアクセスする際に、リクエストされるフォーマット(HTMLやJSONなど)ごとに、処理を分けることができるメソッドです。
createメソッドの場合、受け取ったリクエストのデータ形式がJSONであればformat.json, HTMLであればformat.html側の処理が行われている。

```
respond_to do |format|
  format.形式 {行いたい処理}
end
```

# 使用方法

# 使用する意義
近年に入り、Web APIでJSON形式のデータを扱うことも増えたので、このメソッドを目にする機会も多くなりました。

# 具体のコード
以下の内容はPOST送信で得られたデータがJSON、HTMLによって、処理を分けるという内容か？


```
 respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
```
[【PHP入門】POST送信、GET送信する方法](https://www.sejuku.net/blog/27843)
[Rails-respond_toについて勉強してみた！！初心者](https://qiita.com/jackie0922youhei/items/b597e337feae1524cd8f0) 
