Rails.application.routes.draw do
  get 'page/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'page#index'
  # Defines the root path route ("/")
  # root "articles#index"
end