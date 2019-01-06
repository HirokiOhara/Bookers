## applicaiton_controller
```
### ログインしていないユーザーが、ログイン後のページを見れないようにする
before_action :authenticate_user!

### sign_in/sign_up後のページを指定する
def after_sign_in_path_for(resource)
  mypage_root_path
end

### sign_out後のページを指定する
def after_sign_out_path_for(resource)
  new_user_session_path
end
```

## Gemfile
