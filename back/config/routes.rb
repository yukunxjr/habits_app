Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health_check' => 'elb#health_check'
  devise_for :users
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
      resources :sessions, only: %i[index]
      resources :users, only:[:new]
      resources :notes, only: %i[index show create update destroy]
      resources :skills, only: %i[index create destroy]
      resources :studies, only: %i[index create]
      resources :plans, only: %i[index create destroy]
      get 'trashcan' => 'notes#trashcan'
      post 'notes/:id/restoration' => 'notes#restoration'
      delete 'notes/:id/discard' => 'notes#discard'

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

