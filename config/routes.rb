Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "clinics/registrations"
  }
  root "top#index"

  get 'signup/select', to: 'pages#select_role', as: :select_role
end
