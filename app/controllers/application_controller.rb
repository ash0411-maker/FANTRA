class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	# whenの後はモデル名
	def after_sign_in_path_for(resource)
	  	case resource
	    when Admin
	      admin_home_top_path
	    when Guide
	      tour_guide_top_path
	    when Tourist
	      tourist_tourist_tours_path(current_tourist)
	  	end
	end

	def after_sign_out_path_for(resource)

		if resource == :admin
		  new_admin_session_path
		elsif resource == :guide
		  root_path
		elsif resource == :tourist
		  root_path
		end
	end


	private
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys:[:family_name, :name, :email, :nationality, :postal_code, :address, :phone_number, :identification_image, :selfy_image, :sex, :birth_year, :introduction ])
	  devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end
