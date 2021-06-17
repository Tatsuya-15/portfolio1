Rails.application.routes.draw do

  get 'search/search'
  devise_for :members
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :customers, only: [:index, :show, :edit, :new, :update, :destroy, :create]
  resources :members, only: [:index, :show, :edit, :update]
  get '/search' => 'search#search'
end
