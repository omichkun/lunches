Rails.application.routes.draw do


  root to: "calendar#index"

  resources :orders, except: [:destroy]
  resources :menus
  resources :foods
  resources :calendar, only: [:index]
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
