class SessionsController < ApplicationController
	
	def new
		@redirect_uri = params[:redirect_uri]
	end
	
	def create
		@user = User.find_by_email params[:email]
		
		# Check if user exists, if so, use `authenticate` method that comes with
		# `has_secure_password` method (in user.rb).  Set session to the user_id 
		# if the user authenticates correctly.
		
		if @user && @user.authenticate( params[:password] )
			session[:user_id] = @user.id	
			redirect_to (params[:redirect_uri].presence || root_path), notice: "Signed in successfully."
		else
			flash[:alert] = "Wrong credentials"
			render :new
		end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Signed out successfully."
	end	
	
end
