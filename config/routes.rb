Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  resources :wishes, only: [:new, :create, :edit, :update] do
    member { get :lock }
  end
end
