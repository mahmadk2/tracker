Rails.application.routes.draw do

  
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :user_stocks, except: [:show, :edit, :update]
root 'welcome#index'

resources :users, only: [:show]

resources :friendships

get 'portfolio', to: 'users#portfolio'
get 'search', to: 'stocks#search'
get 'my_friends', to: 'users#my_friends'
get 'search_friend', to: 'users#search'
post 'add_friend', to: 'users#add_friend'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
