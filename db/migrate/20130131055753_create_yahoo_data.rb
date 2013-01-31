class CreateYahooData < ActiveRecord::Migration
  def change
    create_table :yahoo_data do |t|
      t.string :name
      t.string :stocksym
      t.float :price
      t.float :pe
      t.float :divyield

      t.timestamps
    end
  end
end
