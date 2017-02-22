Rails.application.routes.draw do

  concern :recoverable do
    post :recover, on: :member
  end

  devise_for :users
  resources :settings
  resources :traits, concerns: :recoverable
  resources :contact_results
  resources :tracking_types, concerns: :recoverable
  resources :language_levels
  resources :languages, concerns: :recoverable
  resources :professions
  resources :skills
  resources :profiles
  resources :roles
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
  resources :frontpage_elements, concerns: :recoverable
  resources :frontpage_positions, concerns: :recoverable
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
  resources :volunteers, concerns: :recoverable
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
    resources :volunteer_subscribes do
      get :process_request_form, on: :member
      get :undo_rejection_request_form,
          to: 'volunteer_subscribes#mark_request_form_as_pending',
          on: :member
      get :pre_approve_request_form, on: :member
      get :pre_reject_request_form, on: :member
      patch :reject_request_form, on: :member
      get :mark_request_form_as_pending, on: :member
    end
    resources :volunteer_unsubscribes
    resources :volunteer_amendments
    resources :volunteer_appointments
    resources :entity_subscribes
    resources :entity_unsubscribes
    resources :volunteers_demands
    resources :activity_unpublishings
    resources :activity_publishings
    resources :project_unpublishings
    resources :project_publishings
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
