Rails.application.routes.draw do
  root  'pages#index'        #URLの指定がない時
  get 'pages/help'
  
  resources :users
  
  
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
