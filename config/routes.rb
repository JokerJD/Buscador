Rails.application.routes.draw do
  get 'search/show'
  get 'search/new'
  get 'lead/index'

  devise_for :users

  root 'home#index'


end
