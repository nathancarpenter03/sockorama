Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope :api do
    resources :inventories
    resources :products
    resources :carts
    resources :users

    post '/login' => 'sessions#create'
    delete "/logout" => 'session#destroy'
  end

end
