Rails.application.routes.draw do
  get "patients/index"
  get "patients/new"
  get "patients/create"
  get "patients/show"
  get "patients/edit"
  get "patients/update"
  # 1. Deviseの設定
  devise_for :users, controllers: {
    registrations: "clinics/registrations",
    sessions: "users/sessions"
  }

  # 2. 二段階認証（ログイン時の入力画面用）
  # OtpsController (フォルダなし) を使っている場合はこちら
  get "otp/new", to: "otps#new", as: :new_user_otp
  post "otp/create", to: "otps#create", as: :user_otp

  # 3. プロフィール関連（Profiles:: フォルダの中にあるコントローラーたち）
  # URLに /profiles/ をつけたくない場合は scope module を使います
  scope module: :profiles do
    # /profile/edit -> Profiles::ProfilesController
    resource :profile, only: [ :edit, :update ]

    # /two_factor_auth -> Profiles::TwoFactorAuthsController
    # ※もしURLを /profiles/two_factor_auth にしたい場合は、ここを namespace :profiles に戻してください
    resource :two_factor_auth, only: [ :show, :create, :destroy ]
  end

  # 4. その他
  root "top#index"
  get "signup/select", to: "pages#select_role", as: :select_role
  resources :patients
end
