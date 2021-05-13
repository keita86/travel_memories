Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    resources :blog_comments, only: [:create, :destroy]
  end 
  
end
