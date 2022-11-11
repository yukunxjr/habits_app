Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
      resources :users, only:[:show]
      namespace :auth do
        resources :sessions, only: %i[index]
      end
      resources :notes, only: %i[index show create update destroy]
    end
  end
end


# ログイン
  # POST api/v1/auth/sign_up
# ログアウト
  # DELETE api/v1/auth/sign_out (uid,access-token,client)
# 新規登録
  # POST api/v1/auth 
# 退会
  # DELETE api/v1/auth (uid,access-token,client)

