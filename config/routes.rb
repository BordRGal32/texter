Texter::Application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :messages
  resources :users, only: [:show] do
    resources :contacts, only: [:create]
  end

  resources :contacts, only: [:show, :update, :destroy]
end
