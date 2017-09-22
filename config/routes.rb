Rails.application.routes.draw do
  get 'search/show'
  get 'search/new'

  get 'new', to: 'home#new'

  devise_for :users

  root 'home#index'
end
