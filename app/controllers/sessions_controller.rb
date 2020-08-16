class SessionsController < ApplicationController
	before_action :set_current_user
	def create
		 user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
		 if user
			session[:current_user_id] = user.id
			render json: {
				status: :created,
				logged_in: true,
				user: user
			}
		else
			render json: {
				status: 401,
				message: 'You need to login First'
			}
		end	
	end	

	def social_login
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user
			session[:current_user_id] = user.id
			render json: {
				status: :created,
				logged_in: true,
				user: user
			}
		else
			render json: {
				status: 401
			}
		end	
	end	

	def destroy
			session[:current_user_id] = nil
			render json: { status: 200, message: 'You have been logged out' }
	end	

	def logged_in
		if @current_user
			render json: {
				logged_in: true,
				user: @current_user
			}
		else
			
			render json: {
				logged_in: false
			}
		end
	end	
end
