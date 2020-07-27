Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  
  root  'pages#index'        #URLの指定がない時
  get 'pages/help'
  
  resources :users
  resources :topics
  
  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
