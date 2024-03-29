Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users do
    resources :successes, only: [:create, :edit, :update, :destroy]
    resources :emotions, only: [:create, :edit, :update, :destroy]
    resources :messages, only: [:create, :edit, :update, :destroy]
    resources :notes, only: :create
  end

  resources :users, only: [:show, :edit, :destroy]

  resources :successes, only: :show do
    resource :likes, only: [:create, :destroy]
  end

  resources :emotions, only: :show #do
    #resource :likes, only: [:create, :destroy]
  #end

  resources :messages, only: :show do
    resources :comments, only: :create
    #resource :likes, only: [:create, :destroy]
  end

  resources :notes, only: :destroy

end
