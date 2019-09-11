# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|ja/ do
    devise_for :users, controllers: { registrations: "registrations" }
    resources :books
    resources :users, only: [:show]
    get "/books" => "books#index", as: :user_root
  end

  get "/:locale" => "books#index"
end
