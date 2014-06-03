Rails.application.routes.draw do
 root 'pages#helloworld'
 get '/helloworld', to: 'pages#index'
end
