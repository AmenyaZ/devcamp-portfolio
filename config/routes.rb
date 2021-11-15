Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolios/:id', to: 'portfolios#show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'pages/contact'

  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
end
