class ListingsAddIndexUserId < ActiveRecord::Migration[5.1]
  def change
  end

  add_index :listings, :user_id

end
