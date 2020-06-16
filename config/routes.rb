# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "boards#index"

  resources :boards do
    resources :tasks 
  end

  resources :tasks do
    resources :comments
  end

  

  

end
