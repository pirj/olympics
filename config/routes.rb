Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'

  # FIXME: how can this be inferred from Questionnaires concern?
  get 'welcome#answer' => 'welcome#answer'
end
