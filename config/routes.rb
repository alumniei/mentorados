Rails.application.routes.draw do
  resources :registrations, only: %i[create new show] do
    member do
      post :confirm
    end
  end

  resource :dashboard, only: %i[show]
  resources :mentors, only: %i[show]
  resource :session, only: %i[create new destroy]

  root to: 'home#index'
end
