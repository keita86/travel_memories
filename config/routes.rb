Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'daily_rank' => 'blogs#daily_rank'
  get 'weekly_rank' => 'blogs#weekly_rank'
  get 'monthly_rank' => 'blogs#monthly_rank'


  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    get 'confirm'
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get "search" => "searches#search"

  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    resources :blog_comments, only: [:create, :destroy]
  end

end
