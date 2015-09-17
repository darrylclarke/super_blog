class FavouritesController < PostNestingsController
	
	def create
		favourite = Favourite.new( post: @post, user: current_user )
		respond_to do |format|
			if favourite.save
				format.html {redirect_to @post , notice: "Favourite created."}
				format.js   { render }
			else
				format.html {redirect_to @post, alert:  "Favourite not created."}
				format.js   { render }
			end
		end
	end
	
	def destroy
		favourite = Favourite.find params[:id]
		respond_to do |format|
			if can? :destroy, favourite
				favourite.destroy
				format.html {redirect_to @post, notice: "Favourite record deleted."}
				format.js   { render }
			else
				format.html {redirect_to root_path, alert: "Access Denied."}
				format.js   { render }
			end
		end
	end
	
end
