Rails.application.routes.draw do
  resources :blobs, only: [:create, :show]
end