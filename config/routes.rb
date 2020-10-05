# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, skip: :omniauth_callbacks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'api/v1/user/omniauth_callbacks'}
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'sign_up', to: 'registrations#create'
        post 'sign_in', to: 'sessions#create'
        delete 'sign_out', to: 'sessions#destroy'
        namespace :user do
          get 'google_login', to: 'omniauth_callbacks#passthru'
          post 'google_login', to: 'omniauth_callbacks#passthru'
        end
      end

      resources :admins, only: [:index] do
        collection do
          get :users
          post :edit_user
          delete :remove_user
        end
      end
    end
  end
end
