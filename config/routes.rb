Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get "search" => "searches#search"
  
  root to: 'homes#top'
  get 'daily_rank' => 'blogs#daily_rank'
  get 'weekly_rank' => 'blogs#weekly_rank'
  get 'monthly_rank' => 'blogs#monthly_rank'

  get 'about' => 'homes#about'
  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    resources :blog_comments, only: [:create, :destroy]
  end

end
