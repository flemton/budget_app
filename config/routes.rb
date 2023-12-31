Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  root to: 'splash#index'

  resources :groups, only: [:index, :new, :create, :show] do
    resources :entities, only: [:index, :new, :create]
  end
end
