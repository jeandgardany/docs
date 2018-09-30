Rails.application.routes.draw do
  resources :usuarios
  resources :compartilhados do
  	member do
    delete :delete_arquivo_attachment
  end
 end
  resources :roms do
  	member do
    delete :delete_anexo_attachment
    delete :delete_documento_attachment
  end
 end
  devise_for :users
  root to: "roms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
