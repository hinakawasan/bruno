Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'works#index' 
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  
  resources :users, only:[:create, :show, :edit, :update, :destroy]
  resources :genres
  resources :works
end
