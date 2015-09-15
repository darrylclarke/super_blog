class VotesController < ApplicationController

	before_action :authenticate_user!,
				  :find_post

	def create
		vote = Vote.new vote_params
		vote.user = current_user
		vote.post = @post
		if vote.save
			redirect_to @post, notice: (vote_params[:up]=='true' ? "Voted up." : "Voted down.")
		else
			redirect_to @post, alert: "Vote not saved."
		end		
	end
	
	def destroy
		vote = Vote.find params[:id]
		vote_was_up = vote.up?
		if !(can? :destroy, vote)
			redirect_to root_path, alert: "Access denied."
		elsif vote.destroy
			redirect_to @post, notice: (vote_was_up ? "Up vote removed." : "Down vote removed.")
		else
			redirect_to @post, alert: "Vote not removed."
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
