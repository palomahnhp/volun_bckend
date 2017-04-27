Rails.application.routes.draw do

  resources :resources
  concern :recoverable do
    post :recover, on: :member
  end

  devise_for :users
  resources :academic_levels
  resources :activities , concerns: :recoverable
  resources :areas      , concerns: :recoverable
  resources :collectives, concerns: :recoverable
  resources :contact_results
  resources :coordinations, concerns: :recoverable
  resources :degrees, concerns: :recoverable
  resources :districts
  resources :documents
  resources :employment_statuses
  resources :event_types
  resources :events
  resources :frontpage_elements, concerns: :recoverable
  resources :frontpage_positions, concerns: :recoverable
  resources :id_number_types
  resources :language_levels
  resources :languages, concerns: :recoverable
  resources :links do
    post :target, on: :collection
  end
  resources :managers, concerns: :recoverable
  resources :nationalities, concerns: :recoverable
  resources :notice_types
  resources :professions, concerns: :recoverable
  resources :profiles
  resources :proposals
  resources :provinces
  resources :record_histories, concerns: :recoverable
  resources :resources, concerns: :recoverable
  resources :road_types
  resources :roles
  resources :settings
  resources :skills, concerns: :recoverable
  resources :statuses
  resources :timetables
  resources :tracking_types, concerns: :recoverable
  resources :traits, concerns: :recoverable
  resources :unsubscribe_levels
  resources :unsubscribe_reasons, concerns: :recoverable

  resources :addresses do
    get 'bdc_search_towns', on: :collection
    get 'bdc_search_roads', on: :collection
    get 'bdc_search_road_numbers', on: :collection
  end

  # Entity related routes
  resources :entity_types
  resources :entities, concerns: :recoverable
  namespace :ent do
    resources :trackings
  end

  # Volunteer related routes
  resources :volunteers, concerns: :recoverable
    get 'show_sms' => 'volunteers#show_sms', as: 'show_sms'
    get 'send_sms' => 'volunteers#send_sms', as: 'send_sms'
    get 'show_mail' => 'volunteers#show_mail', as: 'show_mail'
    get 'send_mail' => 'volunteers#send_mail', as: 'send_mail'
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
    resources :reasons, concerns: :recoverable
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
    resources :volunteer_unsubscribes do
      get :process_request_form, on: :member
      get :undo_rejection_request_form,
          to: 'volunteer_unsubscribes#mark_request_form_as_pending',
          on: :member
      get :pre_approve_request_form, on: :member
      get :pre_reject_request_form, on: :member
      patch :reject_request_form, on: :member
      get :mark_request_form_as_pending, on: :member
    end
    resources :volunteer_amendments
    resources :volunteer_appointments
    resources :entity_subscribes
    resources :entity_unsubscribes
    resources :volunteers_demands
    resources :activity_unpublishings
    resources :activity_publishings
    resources :project_unpublishings
    resources :project_publishings
    resources :others do
      get :process_request_form, on: :member
      get :undo_rejection_request_form,
          to: 'others#mark_request_form_as_pending',
          on: :member
      get :pre_approve_request_form, on: :member
      get :pre_reject_request_form, on: :member
      patch :reject_request_form, on: :member
      get :mark_request_form_as_pending, on: :member
    end
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
  get 'administration' => 'welcome#administration', as: 'administration'

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
