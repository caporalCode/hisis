# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :amenities, only: %i[index show create update destroy]
      resources :users, only: %i[index show create update destroy]
      resources :rentals, only: %i[index show create update destroy]
      resources :searches, only: %i[index show create update destroy]
      resources :real_estates, only: %i[index show create update destroy] do
        collection do
          get :search
        end
      end
      get 'notifications/me', to: 'notifications#me'
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
