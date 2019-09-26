# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  scope "(/:locale)", locale: /en|ja/ do
    devise_for :users, skip: :omniauth_callbacks, controllers: { registrations: "registrations" }
    resources :books
    resources :users, only: [:show]
    get "/books" => "books#index", as: :user_root
  end

  get "/:locale" => "books#index"
end
