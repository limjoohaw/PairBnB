class ListingsController < ApplicationController

	before_action :check_user, except: [:show]
	before_action :check_owner, except: [:show, :index]

	def index
		@listings = current_user.listings
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(allowed_params)
		@listing.save
		@next = listings_path
		@notice = "Hooray, keep it up!"

		redirect_to @next, :notice => @notice
	end

	def edit
		@listing = Listing.find(params[:id])
	end


	def update
		@listing = Listing.find(params[:id])
		@listing.update_attributes(allowed_params)
		@next = listings_path
		@notice = "Update Successful"

		redirect_to @next, :notice => @notice
	end

	def destroy		
		@listing = Listing.find(params[:id])
		@listing.destroy
		@next = listings_path
		@notice = "Delete Successful"

		redirect_to @next, :alert => @notice
	end


	private
	def allowed_params
		params.require(:listing).permit(:name, :property_type, :phone, :country, :num_room, :price)
	end

	def check_user
		if
			signed_in? && current_user.admin?
		else
			raise ActiveRecord::RecordNotFound
		end
	end

	def check_owner
		if Listing.find(params[:id]).user_id != current_user.id 
		   redirect_to "/404.html"
		end
	end
end
