Rails.application.routes.draw do
  require 'sidekiq/web'
  get '/show', to: 'lead#show'

  get '/search/:project_id', to: 'search#search'

  devise_for :users
  root 'home#index'
  mount Sidekiq::Web => '/sidekiq'
end
