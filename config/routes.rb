Rails.application.routes.draw do
  # Posts
  root to: "posts#index"

  # Users resourse
  resources :users, only: [:index,:show, :new,:create,:edit,:update,:destroy] # сам user
  resource :session, only: [:new,:create,:destroy] # ресурс сессии, тут будут создаваться сессии для user

  # Books resourse
  resources :books, only: [:index, :new, :create, :edit, :update, :show, :destroy] # ресурс для books

  # Authors resourse
  resources :authors, only: [:index, :new, :create, :edit, :update, :show, :destroy] # ресурс для authors

  # Genres resourse
  resources :genres, only: [:index, :new, :create, :destroy, :edit, :update] # ресурс для genres

end
