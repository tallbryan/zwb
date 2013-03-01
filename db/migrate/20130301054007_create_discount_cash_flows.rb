class CreateDiscountCashFlows < ActiveRecord::Migration
  def change
    create_table :discount_cash_flows do |t|
      t.integer :year
      t.float :prev_cash_flow
      t.float :growth_rate
      t.float :cash_flow
      t.float :discount_factor
      t.float :total
      t.references :stock

      t.timestamps
    end
    add_index :discount_cash_flows, :stock_id
  end
end
