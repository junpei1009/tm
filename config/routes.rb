Rails.application.routes.draw do
  namespace :admins do
    get 'orders/index'
    get 'orders/each_index'
    get 'orders/show'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/destroy'
  end
  get 'admins/top'
  namespace :customers do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :customers do
    get 'carts/index'
    get 'carts/destroy'
    get 'carts/update'
    get 'carts/create'
  end
  get 'deliveries/index'
  get 'deliveries/destroy'
  get 'deliveries/edit'
  get 'deliveries/update'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/acount'
  get 'customers/destroy'
  get 'shops/show'
  namespace :admins do
    get 'products/new'
    get 'products/index'
    get 'products/show'
    get 'products/create'
    get 'products/edit'
    get 'products/update'
    get 'products/destroy'
  end
  namespace :customers do
    get 'products/index'
    get 'products/show'
  end
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
