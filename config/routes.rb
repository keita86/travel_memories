Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :blogs do
    resources :blog_comments, only: [:create, :destroy]
  end 
  
end
