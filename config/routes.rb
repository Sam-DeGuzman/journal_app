Rails.application.routes.draw do
  get 'parts/edit'=> 'parts#edit', as: "edit_profile"
  post 'parts/update' => 'parts#update', as: "update_profile"
  root 'entries#landing'
  post 'categories/create' => 'categories#create', as: 'create_category'
  post 'categories/update' => 'categories#update', as: 'update_category'
  post 'entries/update' => 'entries#update', as: 'update_entry'
  post '/entries/create' => 'entries#create', as: 'create_entry'

  devise_for :users


  # devise_for :views

  resources :categories
  resources :entries
  resources :parts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
