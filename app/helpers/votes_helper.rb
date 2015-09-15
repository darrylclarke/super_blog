module VotesHelper
	def current_user_vote
		@current_user_vote ||= current_user.votes.find_by_post_id @post.id
	end
end
