Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'
  resources :news, only: [:index, :show]
  resources :links, only: [:index]
  resources :documents, only: [:index] do
    collection do
      post :index
    end
  end
  resources :events, only: [:index, :show]
  resources :contacts, only: [:index] do
    collection do
      post :index
    end
  end
  resources :registrations, only: [:new, :create]
end
