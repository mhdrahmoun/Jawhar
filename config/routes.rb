Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/change_rejected'

  get 'pages/not_found'

  get 'pages/internal_error'

  get 'comments/new'

  get 'tags/index'

  get 'tags/show'

  devise_for :users, controllers: { 
  	sessions: 'users/sessions',
    registrations: 'users/registrations',
  	confirmations: 'users/confirmations'
  }
  resources :gists
  resources :tags, only: [:index, :show]
  resources :comments, only: [:create]
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
