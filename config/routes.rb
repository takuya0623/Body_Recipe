Rails.application.routes.draw do
  
  namespace :admin do
    devise_for :admins, controllers: {
    sessions: 'admin/admins/sessions',
    registrations: 'admin/admins/registrations',
    passwords: 'admin/admins/passwords'
  }
end
  
  
  namespace :admin do
    resources :calories
  end
  
  
  devise_for :users
  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :comments,only: [:create, :destroy]
  end
  
  get 'user/calories' => 'calories#index', as: 'calories'
  
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  get 'users/:id/follow' =>'users#follow', as: 'follows'

  get 'users/:id/followed'=>'users#followed', as: 'followed'

  get 'user/withdraw' => 'users#withdraw', as: 'withdraw_user'

  patch 'user/change' => 'users#change', as: 'users_change'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
