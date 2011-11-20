Auctioneer::Application.routes.draw do

  scope '/:locale', locale: /en|pl/ do
    match '/' => 'static_pages#home', as: 'home'
  end

  root :to => 'static_pages#landing'

end
