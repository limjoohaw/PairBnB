class AddPictureToListings < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :listings, :picture
  end
end
