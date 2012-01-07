Auctioneer::Application.routes.draw do

  scope '/:locale', locale: /en|pl/ do
    namespace :user do
      resources :auctions do
        put :publish
        put :republish
        put :close
      end
    end
    resource :user, only: :show do
      get :dashboard
    end
    resources :auctions, only: [:index, :show]
    get '/search' => 'auctions#search', as: 'auctions_search'
    devise_for :users
    get '/' => 'static_pages#home', as: 'home'
  end

  namespace :admin do
    root to: 'admins#dashboard'
    get 'admins' => 'admins#index', as: 'admins'
    get 'admins/new' => 'admins#new', as: 'admin_new'
    delete 'admin/:id' => 'admins#destroy', as: 'admin_delete'

    get 'users' => 'users#index', as: 'users'
    get 'user/:id/login' => 'users#login', as: 'user_login'
    get 'user/:id/confirm' => 'users#confirm', as: 'user_confirm'
    get 'user/:id' => 'users#show', as: 'user_show'
    delete 'user/:id' => 'users#destroy', as: 'user_delete'
  end

  devise_for :admins

  root :to => 'static_pages#landing'

end
