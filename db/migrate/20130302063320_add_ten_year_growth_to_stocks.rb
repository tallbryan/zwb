class AddTenYearGrowthToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :ten_year_growth, :float
  end
end
