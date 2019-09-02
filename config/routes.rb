# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope "(/:locale)", locale: /en|ja/ do
    resources :books
  end

  get "/:locale" => "books#index"
end
