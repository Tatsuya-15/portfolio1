Rails.application.routes.draw do

  get 'search/search'
  devise_for :members
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :customers, only: [:index, :show, :edit, :new, :update, :destroy, :create] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :members, only: [:index, :show, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  
  get '/search' => 'search#search'
  
end
