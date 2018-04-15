class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
end



# validates :date_in, :date_out, presence: { message: "Enter dates for check in and check out" }  
# 	validate :date_available


# 	def length_of_stay
# 	 (self.date_out - self.date_in).to_i
# 	end


#   private
# 	def date_available
#     if !date_in.nil? && !date_out.nil?
#        errors.add(:overlap ,"Date overlap")
#       if self.listing.reservations.where("date_in < ? AND date_out > ?","#{date_out}", "#{date_in}").present?
# 	    end
# 		end
# 	end