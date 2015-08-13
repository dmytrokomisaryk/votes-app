Rails.application.routes.draw do
  get 'sign_in' => 'sessions#new', as: :sign_in
  get 'sign_up' => 'users#new', as: :sign_up
  get 'sing_out' => 'sessions#destroy', as: :sign_out

  root 'welcome#index'

  resources :users
  resources :sessions
end
