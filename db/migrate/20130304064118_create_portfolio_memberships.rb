class CreatePortfolioMemberships < ActiveRecord::Migration
  def change
  	create_table :portfolio_memberships, :id => false do |t|
		  t.references :portfolio, :null => false
		  t.references :stock, :null => false
		end

 		add_index(:portfolio_memberships, [:portfolio_id, :stock_id], :unique => true)
  end
end
