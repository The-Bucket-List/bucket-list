Rails.application.routes.draw do
  devise_for :users
  root to: 'ideas#index'
  get 'ideas' => 'ideas#index'
  resources :ideas
  get 'likes/dislike', to: 'likes#dislike', as: :dislike
  resources :likes

end
