class PostNestingsController < ApplicationController
	
	before_action :authenticate_user!
	before_action :find_post, except: [:index]
	
private

	def find_post
		@post = Post.find params[:post_id]
	end
		
end
