Rails.application.routes.draw do
  resources :pictures
  get '/image_of_pictures/:id', to: 'pictures#get_image', as: 'image_of_pictures'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  delete '/unsubscribe', to: 'users#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
