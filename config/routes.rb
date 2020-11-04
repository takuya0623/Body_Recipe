Rails.application.routes.draw do
  
 
  
  devise_for :users
  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :comments,only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  get 'users/:id/follow' =>'users#follow', as: 'follows'

  get 'users/:id/followed'=>'users#followed', as: 'followed'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
