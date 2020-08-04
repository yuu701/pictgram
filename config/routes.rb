Rails.application.routes.draw do
  
  root  'pages#index'        #URLの指定がない時
  get 'pages/help'
  
  get 'topics/new'
  get 'sessions/new'
  
  resources :users
  resources :topics do
    resources :comments
  end
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
