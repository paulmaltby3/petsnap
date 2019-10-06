Rails.application.routes.draw do
  get 'users/:username', to: 'users#show', as: 'user'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :tweets
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
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end







#Rails.application.routes.draw do
#  get 'users/:username', to: 'users#show', as: 'user'
  
#  get 'feed', to: 'feed#show'
  
#  resources :users, only: :show, param: :username do
#    member do
#      post 'follow', to: 'follows#create'
#      delete 'unfollow', to: 'follows#destroy'
     
      #lines below were added to try and access edit_user_registration_path in show.html.erb but didn't work, via https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-password
      #get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      #put 'users' => 'devise/registrations#update', :as => 'user_registration'  
      #also my own --> I thought it would be the one below:
      #get 'edit' => 'users#edit'
      #get 'edit', to: 'registrations#edit'
      
 #   end
#  end
  
#  resources :tweets
#  ActiveAdmin.routes(self)
#  devise_for :users
#  as :user do
#    get "login" => 'devise/sessions#new'
#    delete "signout" => 'devise/sessions#destroy'
#    get "signup" => 'devise/registrations#new'
#  end
  
#  root 'pages#home'
#  get 'about' => 'pages#about'
#  get 'contactus' => 'pages#contactus'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

