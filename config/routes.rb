Rails.application.routes.draw do
  get "doctors/index"
  get "doctors/new"
  get "doctors/create"
  get "lab_orders/index"
  get "lab_orders/new"
  get "lab_orders/create"
  get "lab_orders/show"
  get "lab_orders/edit"
  get "lab_orders/update"
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

  # 4. 患者登録画面
  resources :patients do
    resources :lab_orders, shallow: true
  end

  # 5. openai_parser_service
  resources :lab_orders do
  collection do
    post :analyze_voice # 声の解析用ルートを追加
  end
end

  # 6. その他
  root "top#index"
  get "signup/select", to: "pages#select_role", as: :select_role
  resources :patients
  resources :doctors, only: [ :index, :new, :create, :destroy ]
end
