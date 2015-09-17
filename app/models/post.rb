class Post < ActiveRecord::Base
	validates  :title,    presence:   true, 
	                      uniqueness: true
	belongs_to :user
	belongs_to :category

	has_many   :comments,   dependent: :destroy
	has_many   :favourites, dependent: :destroy
	has_many   :favouriting_users, through: :favourites, source: :user
	
	has_many   :taggings, dependent: :destroy
	has_many   :tags,     through:   :taggings, source: :tag

	has_many   :votes,    dependent: :destroy
	has_many   :voters,   through:   :votes,    source: :user	

	mount_uploader :attachment, AttachmentUploader
	
	def get_comments_in_order
		comments.order( :created_at ).reverse
	end	
	
	def favourite_for( user )
		favourites.find_by_user_id( user.id )
	end
	
	def category_title
		category.title
	end
	#or
	delegate :title, to: :category, prefix: true

	def user_name
		if !user
			"Anonymous"
		else
			user.full_name
		end
	end
	
	def votes_for_post
		votes.select {|v| v.up?}.count - votes.select {|v| v.down?}.count
	end
end
