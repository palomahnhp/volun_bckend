Rails.application.routes.draw do

  concern :recoverable do
    post :recover, on: :member
  end

  devise_for :users
  resources :traits, concerns: :recoverable
  resources :contact_results
  resources :tracking_types, concerns: :recoverable
  resources :language_levels
  resources :languages
  resources :professions
  resources :skills
  resources :profiles
  resources :managers
  resources :unsubscribe_reasons, concerns: :recoverable
  resources :academic_levels
  resources :degrees, concerns: :recoverable
  resources :employment_statuses
  resources :statuses
  resources :nationalities, concerns: :recoverable
  resources :id_number_types
  resources :proposals
  resources :links
  resources :activities
  resources :timetables
  resources :events
  resources :event_types
  resources :documents
  resources :record_histories, concerns: :recoverable
  resources :notice_types
  resources :unsubscribe_levels
  resources :frontpage_elements
  resources :frontpage_positions
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
  resources :request_types
  resources :request_forms, concerns: :recoverable do
    get 'rt_extensions_menu', on: :collection
  end
  namespace :req do
    resources :statuses
    resources :status_traces
    resources :reasons
    resources :rejection_types, concerns: :recoverable
  end
  namespace :rt do
    resources :volunteer_subscribes
    resources :volunteer_unsubscribes
    resources :volunteer_amendments
    resources :volunteer_appointments
    resources :entity_subscribes
    resources :entity_unsubscribes
    resources :volunteers_demands
    resources :activity_actions
    resources :activity_subscribes
    resources :project_actions
    resources :project_subscribes
    resources :others
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
    resources :socials
    resources :centres
    resources :permanents
    resources :punctuals
    resources :entities
    resources :subventions
    resources :others
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'maintenance' => 'welcome#maintenance', as: 'maintenance'

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
