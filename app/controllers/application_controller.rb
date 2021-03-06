class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        if user_signed_in?
            spotify_login_path
        else
            user_path(current_user.id)
        end
        
    end
    def after_sign_out_path_for(resource)
            new_user_session_path
        end
        
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    


end
