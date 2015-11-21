Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  devise_for :users, controllers: { omniauth_callbacks: 'sessions' }

  mount Commontator::Engine => '/commontator'

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # devise_scope :users do
  #   match '/users/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # end
  # match '/sign_out', to: 'sessions#destroy', via: [:get, :post, :delete], as: :sign_out
end
