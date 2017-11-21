Rails.application.routes.draw do
  resources :charges
  resources :wikis
  devise_for :users
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'downgrade' => 'charges#downgrade' 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
