Rails.application.routes.draw do
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
end
