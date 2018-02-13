Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root to: 'pages#index'
  
  resources :products do
    collection do
      get 'search'    
    end
  end

  get 'search', to: 'pages#search'
  get 'show/:id', to: 'pages#show', as: 'show'

  namespace :admin do
    resources :categories do    
      resources :sub_categories, except: [:index, :show]
    end
  end
end
