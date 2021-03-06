# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  scope "(/:locale)", locale: /en|ja/ do
    devise_for :users, skip: :omniauth_callbacks, controllers: { registrations: "registrations" }
    
    resources :books do
      resources :comments, only: [:create, :edit, :update, :destroy], module: :books
    end

    resources :reports do
      resources :comments, only: [:create, :edit, :update, :destroy], module: :reports
    end
    
    resource :home, only: [:show]

    resources :users, only: [:show]
    resources :users do
      member do
        resources :relationships, only: [:create, :destroy]
      end
    end

    get "/books" => "books#index", as: :user_root
  end

  get "/:locale" => "books#index"
end
