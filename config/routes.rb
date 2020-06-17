Rails.application.routes.draw do
  resources :registrations, only: %i[create new show] do
    member do
      post :confirm
    end
  end

  resources :sessions, only: %i[create new]

  root to: 'home#index'
end
