class Tag < ActiveRecord::Base
	validates :name,    uniqueness: true,      presence: true
	has_many :taggings, dependent:  :destroy
	has_many :posts,    through:    :taggings, source: :post
end
