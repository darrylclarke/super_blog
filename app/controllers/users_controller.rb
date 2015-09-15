class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[ :notice ] = "Successfully created new user #{@user.full_name}."
			session[:user_id] = @user.id	# TODO - Am i redirecting properly?
			redirect_to new_post_path, notice: "Signed in successfully."
		else
			flash[ :alert ] = "See errors below..."
			render :new
		end	
	end
	
	def edit
		@user = current_user
	end
	
	def update
		@user = current_user
		if @user.authenticate params[:user][:current_password]
			if @user.update( user_params )
				redirect_to edit_users_path, message: "User updated."
			else
				flash[:alert] = "See errors below."
				render :edit
			end
		else
			flash[:alert] = "Password doesn't match."
			render :edit
		end
	end
	
private

	def user_params
		params.require( :user ).permit( :first_name,
										:last_name,
										:email,
										:password,
										:password_confirmation )
	end
	
end
