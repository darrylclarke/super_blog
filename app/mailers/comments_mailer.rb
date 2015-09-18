class CommentsMailer < ApplicationMailer

	def notify_post_owner( comment )
		@comment   = comment
		@post      = @comment.post
		@post_user = @post.user 
		
		# byebug
		
		mail( to: @post_user.email, subject: "You've got a comment!")	if @post_user	
	end
	

end
