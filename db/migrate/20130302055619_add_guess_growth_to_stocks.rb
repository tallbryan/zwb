class AddGuessGrowthToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :guess_growth, :float
  end
end
