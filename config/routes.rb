Rails.application.routes.draw do
  resources :registrations, only: %i[create new show] do
    member do
      post :confirm
    end
  end

  resource :dashboard, only: %i[show]
  resources :mentors, only: %i[show index]
  resource :session, only: %i[create new destroy]

  resource :profile, only: %i[edit update]

  root to: 'home#index'
end
