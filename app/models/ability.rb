class Ability
	include CanCan::Ability
	
	def initialize( user )
		user ||= User.new
		
		can :manage, Post do |p|
			p.user == user
		end
		
		can :destroy, [Favourite, Vote] do |f|
			f.user == user
		end
		
		can :update, Vote do |v|
			v.user == user
		end
		
		if user.admin?
			can :manage, :all
		end
	end
end 
		