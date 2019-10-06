Rails.application.routes.draw do

  ActiveAdmin.routes(self)
    devise_for :users
    as :user do
      get "login" => 'devise/sessions#new'
      delete "signout" => 'devise/sessions#destroy'
      get "signup" => 'devise/registrations#new'
    end
    root 'pages#home'
    get 'about' => 'pages#about'
    get 'contactus' => 'pages#contactus'  
  
  
  get 'feed', to: 'feed#show'
  

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :tweets
    root 'pages#home'
    get 'about', to: 'pages#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end