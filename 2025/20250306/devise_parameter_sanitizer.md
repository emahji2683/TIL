# devise_parameter_sanitizerとは
deviseの機能の一つ。特定のアクション、カラムに対して、ストロングパラメーターが適用されないようにする。

# ストロングパラメーターとは
明示的に指定されていないパラメーターが保存されるを禁止、また、絶対に必要なパラメーターを指定するする機能のこと。expect(必要), permit(許可)メソッドがある。

>Action ControllerのStrongParametersは、明示的に許可されていないパラメータをActive Modelの「マスアサインメント（mass-assignment: 一括代入）」で利用することを禁止します。

# 方法
以下の通り、対象とするアクション、カラムを指定することで、特定のアクション実行時にストロングパラメーターが適用されないように設定する。

```
devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
```

# 参考資料

- [【Rails】deviseの「新規登録」「ログイン」「情報更新」機能をカスタマイズする際に必要なストロングパラメーターのsanitizerメソッド #Ruby - Qiita](https://qiita.com/AKI3/items/117207bd3cb9642cae0a)
- [Action Controller の概要 - Railsガイド](https://railsguides.jp/action_controller_overview.html)
