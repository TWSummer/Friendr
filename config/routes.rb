Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create]
    resources :profiles, only: [:update]
    get "users/:username", to: "users#fetch_user"
    post "users/demo", to: "users#demo_user"
    resource :session, only: [:create, :destroy]
    resources :questions, only: [:index, :create]
    resources :friend_searches, only: [:index, :update]
    resources :messages, only: [:index]
    get "messages/:username", to: "messages#show"
    post "messages", to: "messages#create"
  end
end
