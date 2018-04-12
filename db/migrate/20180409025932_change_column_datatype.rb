class ChangeColumnDatatype < ActiveRecord::Migration[5.1]
  def change
  	remove_column :listings, :user_id
  end
end
