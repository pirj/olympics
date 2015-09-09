Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  # FIXME: how can this be inferred from Questionnaires concern?
  # get 'home#answer' => 'welcome#answer'
end
