Rails.application.routes.draw do
  root 'paginas_fijas#home'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :tweets,        only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  get    'signup'      => 'users#new'
  get    'signin'      => 'sessions#new'
  delete 'signout'     => 'sessions#destroy'
  get    'acercade'    => 'paginas_fijas#acercade'

  match '*path' => 'application#routing_error', via: :all
end
