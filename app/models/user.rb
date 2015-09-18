class User < ActiveRecord::Base
	has_secure_password  
         # password must be there and password_confirmation has to match
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	
	validates	:email, presence:    true, 
						uniqueness:  true,
						format:      VALID_EMAIL_REGEX
						
	has_many :posts,		dependent: :nullify
	has_many :comments,		dependent: :nullify
	
	has_many :favourites,	dependent: :destroy
	has_many :favourite_posts, through: :favourites, source: :post

	has_many :votes, dependent: :destroy
	has_many :voted_posts, through: :votes, source: :post
		
	def full_name
		"#{first_name} #{last_name}"						
	end
	
	def has_made_post_a_favourite( post )
		favourite_posts.include?( post )
	end
		
end