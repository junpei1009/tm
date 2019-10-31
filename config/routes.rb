Rails.application.routes.draw do
#管理者　顧客　ログイン認証
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

#管理者　顧客購入履歴関係
  scope module: :admins do
    get 'admins/orders' => 'orders#index'
    patch 'admin/orders/:id' => 'orders#update', as: 'orders_update'
    get 'admins/customers/customer_id/orders' => 'orders#each_index'
    get 'admins/customers/customer_id/orders/:id' => 'orders#show'
  end

#管理者　顧客情報関係
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
  end

#管理者　ログイン後画面
    get 'admins/top' => 'admins#top'

#管理者　商品関連
  namespace :admins do
    resources :products
  end

#顧客　注文関係
  scope module: :customers do
    get 'orders/new'
    get 'orders/confirm'
    post 'orders/ok' => 'orders#ok'
    post 'orders' => 'orders#create'
    get 'orders' => 'orders#index'
    get 'orders/:id' => 'orders#show'
    get 'order/thanks' => 'orders#thanks'
  end



#顧客 配送先関連
  scope '/customers/:customer_id' do
    resources :deliveries, only: [:index, :destroy, :edit, :update, :create]
  end

#顧客　顧客情報

  resources :customers do
    scope module: :customers do
      resources :carts, only: [:index, :create, :update, :destroy]
    end
  end

  get 'customers/:id/acount' => 'customers#acount'

#顧客　商品関連
  root :to => 'customers/products#index'
  get '/products/:id' => 'customers/products#show', as: 'product'

#顧客・管理者　店舗情報
  get 'shops/show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
