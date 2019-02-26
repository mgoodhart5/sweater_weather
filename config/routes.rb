Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :backgrounds, only: [:index]
      post 'users', to: "users#create"
      post 'sessions', to: "sessions#create"
      resources :gifs, only: [:index]
    end
  end

end
