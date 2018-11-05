Rails.application.routes.draw do
  resources :articles do
    resources :comments
    end
  
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  
  get 'signup', to: "users#new"
  resources :users, except: [:new]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources :categories, except: [:destroy]

  #get 'signup', to 'users#new'
  #post 'users', to 'users#create'
  #resources :users#, except: [:new]
  
  #get 'login', to 'session#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
