Rails.application.routes.draw do
  devise_for :users
  
  get '/' => "homes#top", as: "home"
  get 'home/about' => "homes#about", as: "home_about"
  resources :books, only: [:index,:create,:show,:edit,:destroy,:update,:destroy]
  resources :users, only: [:show,:index,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
