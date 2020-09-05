Rails.application.routes.draw do
  get 'session/new'
  resources :users, only: [:new, :create, :show]
end
