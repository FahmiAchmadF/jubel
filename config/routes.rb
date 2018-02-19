Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  root to: 'pages#index'
  
  namespace :owner do
    resources :products do
      collection do
        get 'search'
      end
    end
  end

  get 'search', to: 'pages#search'
  get 'show/:id', to: 'pages#show', as: 'show'
  get 'charges/:id/new', to: 'charges#new', as: 'new_charge'
  post 'charges/:id', to: 'charges#create', as: 'create_charge'

  namespace :admin do
    resources :categories do    
      resources :sub_categories, except: [:index, :show]
    end
  end
end
