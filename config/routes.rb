Rails.application.routes.draw do
  root 'welcome#index'

  resources :notices
  get 'welcome/index', as: 'home'
   
  get '/checkout/:title_id', to: 'records#new', as: 'checkout'
  # to do, refactor this to be more resourceful routing
  post '/checkout', to: 'records#create'
  get '/return(/:record_id)', to: 'records#return', as: 'return'
  post '/return/:record_id', to: 'records#return_post', as: 'post_return'

  get '/statistics', to: 'statistics#index'

  get '/accounts', to: 'accounts#index'
  get '/logout', to: 'accounts#logout', as: 'logout'
  get '/accounts/:uniqname', to: 'accounts#show', as: 'account'

  resources :categories
  resources :offices
  resources :titles
  # this param: :record_id thing is kind of kludgy
  # it comes from the need to distinguish title_id and record_id in the records controller
  resources :records, except: :new, param: :record_id
  post '/records/:record_id/confirm_return', to: 'records#confirm_return', as: 'confirm_record'
  resources :administrators

  get '/admin', to: 'admin#index'
  scope path: :admin do
  end

  match '/401', :to => 'errors#unauthorized', :via => :all, :as => 'unauthorized'
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
