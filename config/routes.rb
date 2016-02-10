Rails.application.routes.draw do
  get 'cover/:name', to: 'proxy#cover'

  get 's/:search', to: 'galleries#search'
  get 's/:search/:page', to: 'galleries#search'

  get 'g/:gid/:token', to: 'galleries#show'
  
  get 'p/:gid', to: 'pictures#index'
  get 'p/:gid/:page', to: 'pictures#show'
  
  root to: 'galleries#index'
  get ':page', to: 'galleries#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
