class ChangeDatatypeForNumRoom < ActiveRecord::Migration[5.1]
  def change
  	change_column :listings, :num_room, :string
  end
end
