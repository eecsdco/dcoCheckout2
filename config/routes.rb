Rails.application.routes.draw do
  root 'welcome#index'

  resources :notices
  get 'welcome/index', as: 'home'
   
  get '/checkout/:title_id', to: 'records#new', as: 'checkout'
  # to do, refactor this to be more resourceful routing
  post '/checkout', to: 'records#create'
  get '/return(/:record_id)', to: 'records#return'
  post '/return', to: 'records#return_post'

  get '/statistics', to: 'statistics#index'

  get '/accounts', to: 'accounts#index'
  get '/accounts/:uniqname', to: 'accounts#show', as: 'account'
  get '/accounts/logout', as: 'logout'

  resources :categories
  resources :offices
  resources :titles
  resources :records, except: :new

  get '/admin', to: 'admin#index'
  scope path: :admin do
  end

  match '/401', :to => 'errors#unauthorized', :via => :all, :as => 'unauthorized'
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
