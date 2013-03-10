class AddBuyDecisionToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :buy_decision, :string
  end
end
