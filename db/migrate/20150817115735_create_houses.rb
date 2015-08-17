class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :purchase_price

      t.timestamps null: false
    end
  end
end
