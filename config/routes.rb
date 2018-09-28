Rails.application.routes.draw do
  resources :roms
  devise_for :users
  root to: "roms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
