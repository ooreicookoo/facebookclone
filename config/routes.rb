Rails.application.routes.draw do
      root 'feeds#top'
      resources :sessions, only: [:new, :create, :destroy]
      resources :users, only: [:new, :create, :show, :efid, :update]
      resources :feeds do
        collection do
        post :confirm
      end
      member do
        patch :confirm
      end
    end
  end
