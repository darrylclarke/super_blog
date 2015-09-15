class FavouritesController < PostNestingsController
	
	def create
		favourite = Favourite.new( post: @post, user: current_user )
		if favourite.save
			redirect_to @post, notice: "Favourite created."
		else
			redirect_to @post, alert:  "Favourite not created."
		end
	end
	
	def destroy
		favourite = Favourite.find params[:id]
		if can? :destroy, favourite
			favourite.destroy
			redirect_to @post, notice: "Favourite record deleted."
		else
			redirect_to root_path, alert: "Access Denied."
		end
	end
	
end
