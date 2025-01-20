Rails.application.routes.draw do
  resources :friends do
    post 'send_magic_link'
  end

  resources :posts
  resources :sessions, except: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
