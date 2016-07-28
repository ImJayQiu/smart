class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception

	layout :layout_by_resource


	$site_title = "DPU-CAIC"


	protected

	def configure_permitted_parameters
		added_attrs = [:code, :email, :password, :password_confirmation, :remember_me]
		#devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.for(:sign_up) << added_attrs
		#devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.for(:account_update) << added_attrs
	end


	def layout_by_resource
		if devise_controller?
			"login"
		end
	end
end
