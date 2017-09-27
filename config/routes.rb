Rails.application.routes.draw do
  get '/show', to: 'lead#show'

  get '/search/:id', to: 'search#search'

  devise_for :users
  root 'home#index'

end
