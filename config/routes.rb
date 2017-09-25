Rails.application.routes.draw do
  get 'search/show'

  get 'new', to: 'home#new'

  devise_for :users
  root 'home#index'

end
