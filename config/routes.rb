Rails.application.routes.draw do



  resources :rt_others, only: [:index, :show, :edit, :update]
  resources :rt_activity_unpublishings, only: [:index, :show, :edit, :update]
  resources :rt_activity_publishings, only: [:index, :show, :edit, :update]
  resources :rt_project_unsubscribes, only: [:index, :show, :edit, :update]
  resources :rt_project_unpublishings, only: [:index, :show, :edit, :update]
  resources :rt_project_publishings, only: [:index, :show, :edit, :update]
  resources :rt_volunteers_demands, only: [:index, :show, :edit, :update]
  resources :rt_entity_unsubscribes, only: [:index, :show, :edit, :update]
  resources :rt_entity_subscribes, only: [:index, :show, :edit, :update]
  resources :rt_volunteer_appointments, only: [:index, :show, :edit, :update]
  resources :rt_volunteer_amendments, only: [:index, :show, :edit, :update]
  resources :rt_volunteer_unsubscribes, only: [:index, :show, :edit, :update]
  resources :rt_volunteer_subscribes, only: [:index, :show, :edit, :update]
  resources :pt_entities, only: [:index, :show, :edit, :update]
  resources :pt_subventions, only: [:index, :show, :edit, :update]
  resources :request_forms
  resources :request_reasons
  resources :request_types
  resources :rejection_types
  resources :volunteers
  resources :record_histories
  resources :timetables
  resources :districts
  resources :addresses do
    get 'bdc_search_towns', on: :collection
    get 'bdc_search_roads', on: :collection
  end
  resources :links
  resources :images
  resources :activities
  resources :proposals
  resources :documents
  resources :issues
  resources :trackings
  resources :entities
  resources :entity_types
  resources :road_types
  resources :provinces
  devise_for :users
  resources :users
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
