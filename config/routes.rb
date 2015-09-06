Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'
end
