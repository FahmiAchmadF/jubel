Rails.application.routes.draw do
  devise_for :users, path: 'auth'

end
