Rails.application.routes.draw do
  get 's/:search', to: 'galleries#search'
  get 's/:search/:page', to: 'galleries#search'

  root to: 'galleries#index'
  get ':page', to: 'galleries#index'

  get 'g/:gid/:token', to: 'galleries#show'
  
  get 'p/:gid', to: 'pictures#index'
  get 'p/:gid/:page', to: 'pictures#show'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
