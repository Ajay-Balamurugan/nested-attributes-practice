class Customer::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    # GET /customer/sign_up
    def new
        super
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, customer_attributes: [:phone_number, :address]])
    end
end
