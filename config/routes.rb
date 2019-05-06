Rails.application.routes.draw do
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users

  resources :orders

  resources :line_items

  resources :carts

  get 'store/index'

  resources :products

  get 'example/route1'

  resources :lists, only: [:create, :destroy] do
    resources :tasks, except: [:new, :edit, :show]
  end

  get 'environment', to: 'environment#index'

  root "store#index"

  get 'admin' => 'admin#index'
  
    controller :sessions do
        get 'login' => :new
        post 'login' => :create
        delete 'logout' => :destroy
    end
  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
        get :who_bought, :on => :member
    end
    root :to => 'store#index', :as => 'store'
  end
    
end
