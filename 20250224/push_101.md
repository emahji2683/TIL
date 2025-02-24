# 経緯
ゲストユーザーの情報が編集できる状態であったので、これを制限した。

# 方法
ユーザー情報の内、「メールアド」がゲストユーザーのものと一致する場合、アクセス元のパスに遷移するようにした。

# 前提知識
## resource
現在のユーザーを表すもの。deviseコントローラーないで使用できる。current_userと同義。

# 実装結果

<details>

<summary>app/controllers/users/registrations_controller.rb</summary>


```
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to museums_path, notice: 'ゲストユーザー情報は編集できません'
    end
  end
```

</details>  

# 参考資料
- [【Rails6】ゲストユーザー機能の実装例 #Ruby - Qiita](https://qiita.com/yamaday0u/items/0ad329ff90b6da0ecd8f)
