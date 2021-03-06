Rails.application.routes.draw do


  # devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_for :users
    authenticated :user do
      root to: 'users#current_show', as: :authenticated_root
    end
  # root to: redirect('/users/sign_in')
  root to: 'users#index'

  get 'users/index'
  post 'users/sign_in' => 'users#whatever'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'users#index'
  # resources :likes

  get 'dashboard' => 'dashboard#index'
  get 'dashboard/show' => 'dashboard#show'
  get 'trending' => 'trending#index'
  get 'trending/show' => 'trending#show'
  get 'new_tracks' => 'new_tracks#index'
  get 'new_tracks/show' => 'new_tracks#show'

  post 'like' => 'likes#create'
  post 'follows' => 'follows#create'
  delete 'like' => 'likes#destroy'
  post 'tracks' => 'tracks#create'
  # get 'like/:id' => 'users#divDex'

  delete 'follows' => 'follows#destroy'
  get 'tracks' => 'tracks#index'
  delete 'tracks' => 'tracks#destroy'
  post 'comments' => 'comments#create'
  delete 'comments' => 'comments#destroy'
  delete 'users/:id' => 'users#destroy'
  get 'users/:id' => 'users#show'
  get 'tracks/:id' => 'tracks#show'
  patch 'users/:id' => 'users#update'
  get 'divDex/:id' => 'tracks#divDex'
  get 'commentDex/:id' => 'comments#commentDex'

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
