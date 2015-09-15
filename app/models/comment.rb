class Comment < ActiveRecord::Base
	validates  :body,    presence:   true
	belongs_to :post
	belongs_to :user
	
	def user_name
		if !user
			"Anonymous"
		else
			user.full_name
		end
	end						
end
