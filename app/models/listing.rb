class Listing < ApplicationRecord

	belongs_to :user
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
	has_many :reservations
	has_many :booked_users, through: :reservations, source: :user
end
