Rails.application.routes.draw do
  devise_for :users
  root to: 'ideas#index'
  get 'ideas' => 'ideas#index'
  resources :ideas
end
