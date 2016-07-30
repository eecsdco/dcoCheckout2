Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  
  get '/checkout', to: 'records#checkout'
  post '/checkout', to: 'records#checkout_post'
  get '/return', to: 'records#returnt'
  post '/return/:id', to: 'records#return_post'

  get '/statistics', to: 'statistics#index'

  get '/account', to: 'account#index'
  get '/account/logout', as: 'logout'

  resources :categories
  resources :titles
  resources :records, only: [:show, :create]

  get '/admin', to: 'admin#index'
  scope path: :admin do
  end

  match '/401', :to => 'errors#unauthorized', :via => :all, :as => 'unauthorized'
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
