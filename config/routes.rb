# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chat_rooms, only: %i[new create show index]
  resources :messages
  mount ActionCable.server => "/cable"
  root "chat_rooms#index"
end
