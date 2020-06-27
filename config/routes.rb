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

  get :code_of_conduct, to: 'home#code_of_conduct'
  get :privacy, to: 'home#privacy'
  get :cookies, to: 'home#cookies'

  root to: 'home#index'
end
