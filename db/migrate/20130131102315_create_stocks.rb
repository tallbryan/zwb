class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.float :price
      t.float :pe
      t.float :div

      t.timestamps
    end
  end
end
