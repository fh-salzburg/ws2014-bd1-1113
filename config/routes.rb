Rails.application.routes.draw do
  resources :questions # , only: [ :index, :show, :update ]

  namespace :api do
    resources :questions, only: [:index, :create]
  end
end
