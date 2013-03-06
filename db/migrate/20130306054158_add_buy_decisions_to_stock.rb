class AddBuyDecisionsToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :buy_at, :decimal
    add_column :stocks, :dollar_difference, :decimal
    add_column :stocks, :difference, :decimal
    add_column :stocks, :market_value, :decimal
  end
end
