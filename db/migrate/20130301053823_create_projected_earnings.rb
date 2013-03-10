class CreateProjectedEarnings < ActiveRecord::Migration
  def change
    create_table :projected_earnings do |t|
      t.float :earnings
      t.float :ave_pe
      t.integer :year
      t.references :stock

      t.timestamps
    end
    add_index :projected_earnings, :stock_id
  end
end
