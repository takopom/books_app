# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(/:locale)", locale: /en|ja/ do
    devise_for :users
    resources :books
  end

  get "/:locale" => "books#index"
end
