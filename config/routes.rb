Rails.application.routes.draw do
  
  get "students/sorted_students", to: "students#sorted_students"
  resources :students
  resources :mentors
  resources :enrollments
  resources :mentor_enrollment_assignments
  resources :lessons
  resources :courses do
    resources :submissions
  end
  resources :coding_classes
  resources :trimesters
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/trimesters", to: "trimesters#index"
  get "/trimesters/:id", to: "trimesters#show" 
  get "/dashboard", to: "admin_dashboard#index"
  get "/courses/:id", to: "courses#show"
  get "trimesters/:id", to: "trimesters#show"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
