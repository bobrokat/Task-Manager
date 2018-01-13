Rails.application.routes.draw do
  resources :comments
  resources :tasks
  resources :projects
  devise_for :users
  root 'pages#welcome'
  
  namespace :api do
    resources :projects
    resources :tasks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
