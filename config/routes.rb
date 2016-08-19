Rails.application.routes.draw do

  # TODO clean up routes.rb TODO

  get '/titles/search', to: 'titles#search', as: 'search_titles'
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
  get '/account(/:uniqname)', to: 'accounts#show', as: 'account'
  # originally, this path was /account(/:uniqname)/history, such that uniqname
  # was an optional field, but it was getting gobbled up by the
  # /account(:/uniqname) route; the simple fix to this is to move the history
  # route above the account show route, but, if someone with the uniqname
  # history ever attempts to view their account, it wouldn't really work...
  get '/account/:uniqname/history', to: 'accounts#history', as: 'account_history'
  get '/account/:uniqname/statistics', to: 'accounts#statistics', as: 'account_statistics'
  get '/logout', to: 'accounts#logout', as: 'logout'

  resources :categories, except: [:destroy]
  get 'categories/:id/disable(.:format)', to: 'categories#disable', as: 'disable_category'
  get 'categories/:id/enable(.:format)', to: 'categories#enable', as: 'enable_category'
  resources :offices
  resources :titles do
    collection do
      # this post request should be a get (b/c we're getting a form), but,
      # because we're passing multiple title id's as an array, it's better to
      # do it as a post request
      post 'enable_multiple'
    end
  end
  # this param: :record_id thing is kind of kludgy
  # it comes from the need to distinguish title_id and record_id in the records controller
  resources :records, except: :new, param: :record_id
  post '/records/:record_id/confirm_return', to: 'records#confirm_return', as: 'confirm_record'

  get '/admin', to: 'admin#index'
  get '/admin/unreturned', to: 'admin#unreturned', as: 'admin_unreturned'
  get '/admin/longterm', to: 'admin#longterm', as: 'admin_longterm'

  match '/401', :to => 'errors#unauthorized', :via => :all, :as => 'unauthorized'
  match '/404', :to => 'errors#not_found', :via => :all, :as => 'not_found'
  match '/500', :to => 'errors#internal_server_error', :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
