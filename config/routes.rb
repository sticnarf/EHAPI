Rails.application.routes.draw do
  get 'search/:search', to: 'galleries#search'
  get 'search/:search/:page', to: 'galleries#search'

  get 'index', to: 'galleries#index'
  get 'index/:page', to: 'galleries#index'
  
  get 'g/:gid/:token', to: 'galleries#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
