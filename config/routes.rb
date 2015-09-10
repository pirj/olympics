Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'
  resources :news, only: [:index, :show]

  # FIXME: how can this be inferred from Questionnaires concern?
  # get 'home#answer' => 'welcome#answer'
end
