class Employee::RegistrationsController < Devise::RegistrationsController
    # GET /customer/sign_up
    def new
        super
    end
end
