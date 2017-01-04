Rails.application.routes.draw do



  resources :request_forms
  resources :request_reasons
  resources :request_types
  resources :rejection_types
  resources :volunteers
  resources :record_histories
  resources :addresses
  resources :proposals
  resources :links
  resources :activities
  resources :timetables
  resources :events
  resources :documents
  resources :issues
  resources :trackings
  resources :entities
  resources :entity_types
  resources :road_types
  resources :provinces
  devise_for :users
  namespace :rt do
    resources :others
    resources :activity_unpublishings
    resources :activity_publishings
    resources :project_unsubscribes
    resources :project_unpublishings
    resources :project_publishings
    resources :volunteers_demands
    resources :entity_unsubscribes
    resources :entity_subscribes
    resources :volunteer_appointments
    resources :volunteer_amendments
    resources :volunteer_unsubscribes
    resources :volunteer_subscribes
  end
  namespace :pt do
    resources :entities
    resources :subventions
  end
  resources :addresses do
    get 'bdc_search_towns', on: :collection
    get 'bdc_search_roads', on: :collection
    get 'bdc_search_road_numbers', on: :collection
  end
  concern :recoverable do
    post :recover, on: :member
  end
  resources :projects, concerns: :recoverable do
    get 'pt_extensions_menu', on: :collection
  end
  resources :request_forms, concerns: :recoverable do
    get 'rt_extensions_menu', on: :collection
  end
  resources :project_types, concerns: :recoverable
  resources :coordinations, concerns: :recoverable
  resources :collectives  , concerns: :recoverable
  resources :areas        , concerns: :recoverable

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'maintenance' => 'welcome#maintenance', as: 'maintenance'

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
