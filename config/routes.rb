Rails.application.routes.draw do
  resources :things

 get '/helloworld', to: 'pages#helloworld'
end
