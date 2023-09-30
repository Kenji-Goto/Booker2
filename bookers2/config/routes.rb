Rails.application.routes.draw do
  devise_for :users
  
  
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: "home"
  resources :books, only: [:index,:create,:show,:edit,:destroy,:update,:destroy]
  resources :users, only: [:show,:index,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
