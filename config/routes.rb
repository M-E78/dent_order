Rails.application.routes.draw do
  get "otps/new"
  get "otps/create"
  # 1. Deviseの設定（新規登録とログインのカスタムコントローラーを指定）
  devise_for :users, controllers: {
    registrations: "clinics/registrations",
    sessions: "users/sessions"
  }

  # 2. 二段階認証コード入力用のルート
  get 'otp/new', to: 'otps#new', as: :new_user_otp
  post 'otp/create', to: 'otps#create', as: :user_otp

  # 3. 二段階認証の設定画面（マイページ用）
  namespace :profiles do
    resource :two_factor_auth, only: [:show, :create, :destroy]
  end

  # 4. トップ画面
  root "top#index"

  # 5. ロール選択画面
  get 'signup/select', to: 'pages#select_role', as: :select_role
end