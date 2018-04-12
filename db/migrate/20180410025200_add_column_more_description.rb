class AddColumnMoreDescription < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :more_description, :text
  end
end
