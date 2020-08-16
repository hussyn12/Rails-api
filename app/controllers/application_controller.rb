class ApplicationController < ActionController::API
	skip_before_action :verify_authenticity_token, raise: false
	before_action :set_current_user

	def set_current_user
		if session[:current_user_id]
			@current_user = User.find(session[:current_user_id]) 
		end
	end	

	def authorize
		unless set_current_user
			render json: {
				logged_in: false,
				message: "Please Login to view profile"
			}
		end	
	end	


    respond_to :json
end
