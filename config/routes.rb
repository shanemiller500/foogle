Rails.application.routes.draw do
  devise_for :users
  resources :things
  root 'pages#helloworld'
 get '/helloworld', to: 'pages#helloworld'
end
