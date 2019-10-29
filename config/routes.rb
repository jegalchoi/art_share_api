Rails.application.routes.draw do
  resources :users, only: [:update, :show, :index, :destroy, :create]
  
  resources :users do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  
  resources :artworks, only: [:update, :show, :destroy, :create]

  resources :artworks do
    resources :comments, only: [:index]
  end
  
  resources :artwork_shares, only: [:destroy, :create]

  resources :comments, only: [:destroy, :create]

end
