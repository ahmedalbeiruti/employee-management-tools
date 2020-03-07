# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :employees, only: %i[index] do
    resources :tasks, only: %i[index]
  end

  match '*path' => 'errors#routing_error', via: :all
end
