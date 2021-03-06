Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'

  resources :news, only: [:index, :show]
  resources :links, only: [:index]
  resources :events, only: [:index, :show]
  resources :registrations, only: [:new, :create]

  [:documents, :contacts, :faq].each do |page|
    resources page, only: [:index] do
      collection do
        post :index
      end
    end
  end
end
