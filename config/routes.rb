Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create,:destroy]
  end

  resources :groups, only: [:new, :index, :show, :create, :edit, :update]

  get '/search', to: 'searches#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
