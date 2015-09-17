class VotesController < ApplicationController

	before_action :authenticate_user!,
				  :find_post

	def create
		vote = Vote.new vote_params
		vote.user = current_user
		vote.post = @post
		respond_to do |format|
			if vote.save
				format.html { redirect_to @post, notice: (vote_params[:up]=='true' ? "Voted up." : "Voted down.") }
				format.js   { render }
			else
				format.html { redirect_to @post, alert: "Vote not saved." }
				format.js   { render }
			end		
		end		
	end
	
	def destroy
		vote = Vote.find params[:id]
		vote_was_up = vote.up?
		respond_to do |format|
			if !(can? :destroy, vote)
				format.html { redirect_to root_path, alert: "Access denied."  }
				format.js   {  render }
			elsif vote.destroy
				format.html { redirect_to @post, notice: (vote_was_up ? "Up vote removed." : "Down vote removed.")  }
				format.js   {  render }
			else
				format.html { redirect_to @post, alert: "Vote not removed."  }
				format.js   {  render }
			end		
		end		
	end
	
	def update
		
	end


private
	def find_post
		@post = Post.find params[:post_id]
	end
	
	def vote_params
		params.require( :vote ).permit( :up )
	end
		
end
