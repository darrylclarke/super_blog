class Comment < ActiveRecord::Base
	validates :made_by, presence:   true
	validates :body,    presence:   true, 
						uniqueness: true
end
