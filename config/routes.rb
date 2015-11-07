Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  devise_for :users

  devise_scope :users do
    match '/users/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  end
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
end
