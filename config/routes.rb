Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  devise_scope :user do
    # Customer routes
    get '/customer/sign_up', to: 'customer/registrations#new', as: :new_customer_registration
    post '/customer/sign_up', to: 'customer/registrations#create', as: :customer_registration

    # Employee routes
    get '/employee/sign_up', to: 'employee/registrations#new', as: :new_employee_registration
    post '/employee/sign_up', to: 'employee/registrations#create', as: :employee_registration

    # Admin routes
    get '/admin/sign_up', to: 'admin/registrations#new', as: :new_admin_registration
    post '/admin/sign_up', to: 'admin/registrations#create', as: :admin_registration
 end
end
