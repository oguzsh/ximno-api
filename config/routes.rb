Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new', controllers: { sessions: 'sessions' }
  end

  devise_for :users, controllers: { sessions: 'sessions' }
  resource :users do
    member do
      get :following, :followers
    end
  end

  root 'feeds#index'

  resources :posts do
    resources :comments
  end
  resources :trainings_programs do
    resources :trainings
  end
  resources :follows, only: %i[create destroy]
end
