Rails.application.routes.draw do
  get 'ideas' => 'ideas#index'
  resources :ideas
end
