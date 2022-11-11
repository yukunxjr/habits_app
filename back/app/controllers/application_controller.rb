class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
        skip_before_action :verify_authenticity_token
         # deviseコントローラーにストロングパラメータを追加する 
        before_action :configure_permitted_parameters, if: :devise_controller?

        protected
        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
                # アカウント編集の時にnameのストロングパラメータを追加
                # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end
        
end