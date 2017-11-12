Rails.application.routes.draw do
  # get 'wikis/index'

  # get 'wikis/show'

  # get 'wikis/new'

  # get 'wikis/edit'
  
  resources :wikis

  devise_for :users
 
  root 'welcome#index'
  
  # get 'welcome/index'

  get 'about' => 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
