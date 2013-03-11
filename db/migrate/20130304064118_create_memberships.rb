class CreateMemberships < ActiveRecord::Migration
  def change
  	create_table :memberships, :id => false do |t|
		  t.references :portfolio, :null => false
		  t.references :stock, :null => false
		end

 		add_index(:memberships, [:portfolio_id, :stock_id], :unique => false)
  end
end
