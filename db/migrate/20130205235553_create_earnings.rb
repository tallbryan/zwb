class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.integar :year
      t.float :pe
      t.float :div
      t.float :sheq
      t.float :earnings
      t.references :stock

      t.timestamps
    end
    add_index :earnings, :stock_id
  end
end
