Rails.application.routes.draw do
  resources :articles do
    resources :comments
    end
  
  
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  #get 'signup', to 'users#new'
  #post 'users', to 'users#create'
  resources :users#, except: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
