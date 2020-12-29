# frozen_string_literal: true

require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_scope :user do
    get "sign_in_with_token", to: "users/sessions#sign_in_with_token"
    # get "email_confirmation", to: "users/sessions#redirect_from_magic_link"
    # post "sign_in_with_token", to: "users/sessions#sign_in_with_token"
  end

  resources :lists do
    resources :items
  end

  mount Sidekiq::Web => "/jobs"

  root to: "lists#index"
end