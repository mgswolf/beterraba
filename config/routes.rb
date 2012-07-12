Beterraba::Application.routes.draw do
  get "home/index"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
       namespace :admin do
         root :to => 'home#index'
         resources :home, :only => [:index]
        end
end
