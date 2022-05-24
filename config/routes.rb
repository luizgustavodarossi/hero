Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index create]
  resources :weapons
  resources :enemies, only: %i[update destroy]
end
