Rails.application.routes.draw do
  devise_for :users
  root to: 'ratings#index'
  resources :ratings do
    resources :recipes
  end
end