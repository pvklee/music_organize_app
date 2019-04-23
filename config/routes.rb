Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] do
    resources :notes, only: :new
  end
  resource :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: :new
  end
  resources :albums do
    resources :tracks, only: :new
  end
  resources :tracks do
    resources :notes, only: :new
  end
  resources :notes

  root to: redirect('/bands')
end
