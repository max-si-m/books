Rails.application.routes.draw do
  devise_for :users
  resources :books do
    member do
      post 'draft'
      post 'publish'
    end
  end

  root 'books#index'
end
