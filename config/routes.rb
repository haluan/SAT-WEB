Rails.application.routes.draw do
  resources :generator, only: [:index]

  get 'cat_gen', to: "generator#category"
  get 'vsales_product', to: 'report#vsales_product'
  get 'vsales_product_choice', to: 'report#vsales_product_choice'
  get 'vsales_year', to: 'report#vsales_year'
  get 'vsales_loc', to: 'report#vsales_loc'
  get 'vsales_lochice', to: 'report#vsales_lochice'
  get 'posemail_gen', to:'generator#posemail'
  get 'vsales_gen', to:'generator#vsales'

  get 'vsaleschoice', to: 'report#vsaleschoice'

  get 'posemailchoice', to: 'report#posemailchoice'

  get 'generator/vsales'

  get 'signin', to: 'sessions#new'

  get 'vsales', to: 'report#vsales'
  get 'posemail', to: 'report#posemail'
  get 'signout', to: 'sessions#destroy'

  resources :tests
  resources :sessions, except:[:update, :edit]

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
