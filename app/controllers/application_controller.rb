class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :person, contains: [:admin, :owner]
  before_action :authenticate_person!
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  	def after_sign_in_path_for(resource)
			if current_owner		
				admins_List_path			
			else
				zombies_path			
			end		
		end
end
