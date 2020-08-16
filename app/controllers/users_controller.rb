class UsersController < ApplicationController
	respond_to :json
	def create
		user = User.create!(user_params)
		if user
			session[:current_user_id] = user.id
			render json: { status: 201, message: 'User has been created', user: user}
		else
			render json: { status: 500, message: 'You need to login First'}
		end		
	end	
	private

	def user_params
		params.permit(:id, :email, :password, :first_name, :last_name, :age, :profile_image, :provider, :uid)
	end	
end
