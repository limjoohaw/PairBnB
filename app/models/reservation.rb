class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	# validates :date_in, :date_out, presence: { message: "Enter dates for check in and check out" }  
	validate :date_available, on: :create


	def length_of_stay
	 (self.date_out - self.date_in).to_i
	end

	def total_amount
		self.length_of_stay * self.listing.price
	end


  private
	def date_available
    self.listing.reservations.each {|r|
    	x = (r.date_in..r.date_out).to_a
    	# x.pop #<= this doesn't work when user book only 1 night
    	# x.shift #<= this doesn't work when user book only 1 night
    	y = (date_in..date_out).to_a
    	unless (x & y).empty?
      	errors.add(:overlap ,"Date overlap")
      	break
      end
    }
	end
end