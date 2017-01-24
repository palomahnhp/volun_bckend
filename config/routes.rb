Rails.application.routes.draw do

  concern :recoverable do
    post :recover, on: :member
  end

  devise_for :users
  resources :traits
  resources :contact_results
  resources :tracking_types
  resources :language_levels
  resources :languages
  resources :professions
  resources :skills
  resources :profiles
  resources :managers
  resources :unsubscribe_reasons
  resources :academic_levels
  resources :degrees
  resources :employment_statuses
  resources :statuses
  resources :nationalities
  resources :id_number_types
  resources :proposals
  resources :links
  resources :activities
  resources :timetables
  resources :events
  resources :event_types
  resources :documents
  resources :districts
  resources :road_types
  resources :provinces
  resources :record_histories
  resources :notice_types
  resources :coordinations, concerns: :recoverable
  resources :collectives  , concerns: :recoverable
  resources :areas        , concerns: :recoverable

  resources :addresses do
    get 'bdc_search_towns', on: :collection
    get 'bdc_search_roads', on: :collection
    get 'bdc_search_road_numbers', on: :collection
  end

  # Entity related routes
  resources :entity_types
  resources :entities
  namespace :ent do
    resources :trackings
  end

  # Volunteer related routes
  resources :volunteers
  namespace :volun do
    resources :assessments
    resources :availabilities
    resources :contacts
    resources :trackings
  end

  # RequestForm related routes
  resources :request_reasons
  resources :request_reasons
  resources :rejection_types
  resources :request_types
  resources :request_forms, concerns: :recoverable do
    get 'rt_extensions_menu', on: :collection
  end
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

  # Project related routes
  resources :project_types, concerns: :recoverable
  resources :projects, concerns: :recoverable do
    get 'pt_extensions_menu', on: :collection
  end
  namespace :pro do
    resources :issues
    resources :trackings
  end
  namespace :pt do
    resources :entities
    resources :subventions
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'maintenance' => 'welcome#maintenance', as: 'maintenance'

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
