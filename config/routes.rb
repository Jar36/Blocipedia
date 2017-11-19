Rails.application.routes.draw do
  # get 'charges/index'

  # get 'charges/show'

  # get 'charges/new'

  # get 'charges/edit'

  # get 'wikis/index'

  # get 'wikis/show'

  # get 'wikis/new'

  # get 'wikis/edit'
  resources :charges
  resources :wikis
  devise_for :users
  root 'welcome#index'
  # get 'welcome/index'
  get 'about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
