Rails.application.routes.draw do
  resources :rec_books
  resources :histories
  get 'home/index'

  resources :users
  resources :books

  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'home#index'
  # root :to => 'sessions#new'
  get "home/index"

  get '/signin',  to: 'sessions#new'
  get '/signup',  to: 'users#new'
  get '/signout', to: 'sessions#destroy', via: :delete
  get '/search', to: 'books#index'
  get '/books/:id/checkout(.:format)' => 'books#checkout', as: :checkout_book
  get '/books/:id/checkin(.:format)' => 'books#checkin', as: :checkin_book
  get '/users/histories/:id(.:format)' =>    'histories#index', as: :checkout_history
  get '/books/histories/bookindex/:id(.:format)' =>    'histories#bookindex', as: :checkout_history_book
  post '/books/:id/checkout(.:format)' => 'books#checkout'
  get '/books/:id/send_notification(.:format)' => 'books#send_notification', as: :send_notification
  #get '/histories/:id', to: 'histories#index'
  #get '/histories/checkout/:id' to: 'histories#checkout'
  #get '/checkout/:id', to: 'histories#index'
  #get '/books/:id', to: 'histories#show'
  #get '/histories/:id', to: 'histories#show'

  #get 'checkout' => 'books#checkout' as :checkout
  #get '/checkout' to: 'books#checkout'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
