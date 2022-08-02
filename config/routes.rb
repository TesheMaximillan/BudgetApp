Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"

  authenticated :user do
    resources :categories, only: [:index, :create, :new] do
      resources :budget_transactions, only: [:index, :create, :new]
    end
  end
end
