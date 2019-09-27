# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|ja/ do
    devise_for :users, controllers: { registrations: "registrations" }
    resources :books
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
