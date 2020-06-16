# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "boards#index"

  resources :boards do
    resources :tasks 
  end

  resources :tasks do
    resources :comments
  end

  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    delete 'destroy', :on => :
  end

end
