Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :wishes, only: [:new, :create, :edit, :update]
  root 'dashboard#index'
end
