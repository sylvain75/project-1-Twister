Rails.application.routes.draw do
  

  get '/twists' => 'twist#index'
  get '/twist/new' => 'twist#new'
  get '/twist/:id/show' => 'twist#show', :as => :show_twist
  post '/twists' => 'twist#create'
  get '/twist/:id/edit' => 'twist#edit', :as => :edit_twist
  patch '/twists/:id' => 'twist#update'
  
  get 'session/new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get 'pages/index'
  get '/about' => 'pages#about'

  root :to => 'pages#index'
  get '/index' => 'pages#index'

  resources :users do
    member do
      get :follow, :followers, :following
      delete :unfollow, :as => 'unfollow'
    end
  end
  resources :twists do
    resources :comments

  end
end








 
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

