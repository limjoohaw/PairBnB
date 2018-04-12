class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	# rename_column :listings, :email, :user_id
  	# rename_column :listings, :room_type, :property_type
  	rename_column :listings, :birthday, :num_room
  end
end