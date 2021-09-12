Rails.application.routes.draw do
  resources :registrations, only: %i[create new show] do
    member do
      post :confirm
    end
  end

  resources :invitations, only: %i[create new show] do
    member do
      post :confirm
    end
  end

  resources :password_recoveries, only: %i[create new show]
  resources :passwords, only: %i[create]

  resource :dashboard, only: %i[show]
  resources :mentors, only: %i[show index]
  resource :session, only: %i[create new destroy]

  resource :profile, only: %i[edit update]
  resource :settings, only: %i[edit update]

  get :code_of_conduct, to: 'home#code_of_conduct'
  get :privacy, to: 'home#privacy'
  get :cookies, to: 'home#cookie_policy'

  root to: 'home#index'
end
