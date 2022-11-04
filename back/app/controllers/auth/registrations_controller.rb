# class Auth::RegistrationsController < ApplicationController
# end

# class V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
# end


class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController


    private

    def sign_up_params
         params.require(:registration).permit(:name,:email, :password, :password_confirmation)
     end

     def account_update_params
         params.require(:registration).permit(:name, :email,:password,:password_confirmation)
     end
end
