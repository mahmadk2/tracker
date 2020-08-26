Rails.application.routes.draw do

  
  devise_for :users
  resources :user_stocks, except: [:show, :edit, :update]
root 'welcome#index'

get 'portfolio', to: 'users#portfolio'
get 'search', to: 'stocks#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
