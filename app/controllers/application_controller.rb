class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 # before_action :authenticate_user! #deviseのメソッド。ログイン未認証の場合、rootパスへリダイレクトする


 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end

end
