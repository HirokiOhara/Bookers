Rails.application.routes.draw do
  root 'users#top'
  get'/about' => 'users#about'
  devise_for :users
  resources :users
  resources :books
end
