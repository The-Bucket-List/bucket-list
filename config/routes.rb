Rails.application.routes.draw do
  get 'ideas' => 'ideas#index'
  resource :ideas
end
