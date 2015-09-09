AccessoriesStore::Application.routes.draw do
  devise_for :users

  resources :filters
  resources :categories do
    resources :sub_folders
  end
  resources :products
  resources :currencies
  resources :welcome
  resources :customers

  resources :products do
    post :preview, on: :collection
  end
  root :to => 'welcome#index'
end
