class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :phone
      t.string :country
      t.date :birthday

      t.timestamps
    end
  end
end
