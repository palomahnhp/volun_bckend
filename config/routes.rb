Rails.application.routes.draw do



  concern :recoverable do
    post :recover, on: :member
  end
  resources :projects, concerns: :recoverable do
    get 'new_options', on: :collection
  end
  devise_for :users
  resources :record_histories
  resources :districts
  resources :addresses
  resources :project_type_others
  resources :project_type_socials
  resources :project_type_centres
  resources :project_type_permanents
  resources :project_type_punctuals
  resources :project_type_entities
  resources :project_type_subventions
  resources :activities
  resources :proposals
  resources :timetables
  resources :documents
  resources :issues
  resources :trackings
  resources :entities
  resources :project_types, concerns: :recoverable
  resources :coordinations, concerns: :recoverable
  resources :collectives  , concerns: :recoverable
  resources :areas        , concerns: :recoverable

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'maintenance' => 'welcome#maintenance', as: 'maintenance'

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  # root 'proposals#index'

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
