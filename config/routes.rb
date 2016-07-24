Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  resources :books do
    member do
      post 'draft'
      post 'publish'
    end
  end

  namespace :admin do
    get 'dashboard/index'
    root 'dashboard#index'

    resources :genres
    resources :books do
      member do
        post 'draft'
        post 'publish'
      end
    end
  end

  root 'books#index'
end
