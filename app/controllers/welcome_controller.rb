class WelcomeController < ApplicationController
	def show
		@listings = Listing.all
	end		
end
