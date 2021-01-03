Rails.application.routes.draw do
  
  devise_for :admins
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  resources :orders do
    resources:orderitems
  end
  
  devise_for :users do
  resources:orders
  end 
  
  get '/checkout' => 'cart#createOrder'
  get 'cart/index'
  
  post '/search' => 'products#search'

  resources :products
  root 'static_pages#home'
  
  get '/home'=> 'static_pages#home'
  
  get '/profile' => 'static_pages#profile'
  
  #Login and logout
  get '/login', to: 'user#login'
  get '/logout', to: 'user#logout'
  
  #get '/users/sign_out', to: 'user#sign_out'
  
  get '/products' => 'static_pages#products'
  
  
  get '/cart', to: 'cart#index'

  get '/cart/clear', to: 'cart#clear'
  
  # add item to a new cart
  get '/cart/:id', to: 'cart#add'
  
  #increase quantity of item that already exists in the cart
  get '/cart/increase/:id' => 'cart#increase'
  get 'increase/:id' => 'cart#increase'
  
  #decrease quantity of item that already exists in the cart
  get '/cart/decrease/:id' => 'cart#decrease'
  get 'decrease/:id' => 'cart#decrease'
  
  #remove item from cart
  get '/cart/remove/:id' => 'cart#remove'
  get 'remove/:id' => 'cart#remove'
  #get '/thankyou' => 'static_pages#thankyou'
  get '/thankyou/:id' => 'static_pages#thankyou'
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
