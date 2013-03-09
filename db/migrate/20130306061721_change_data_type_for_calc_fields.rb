class ChangeDataTypeForCalcFields < ActiveRecord::Migration
  def self.up
  	change_table :stocks do |t|
  		t.change :price, :float
        t.change :pe,    :float
        t.change :div,   :float
        t.change :guess_growth, :float
        t.change :ten_year_growth, :float
    end
  
   	change_table :earnings do |t|
      t.change :pe, :float
      t.change :div, :float
      t.change :sheq, :float
      t.change :earnings, :float
  end

      change_table :projected_earnings do |t|
       t.change :earnings, :float
       t.change :ave_pe, :float
   end

       change_table :discount_cash_flows do |t|
        t.change :prev_cash_flow, :float
        t.change :growth_rate, :float
        t.change :cash_flow, :float
        t.change :discount_factor, :float
        t.change :total, :float
    end
  end


  def self.down
  	  change_table :stocks do |t|
  		t.change :price, :decimal
        t.change :pe,    :decimal
        t.change :div,   :decimal
        t.change :guess_growth, :decimal
        t.change :ten_year_growth, :decimal
     end

     change_table :earnings do |t|
      t.change :pe, :decimal
      t.change :div, :decimal
      t.change :sheq, :decimal
      t.change :earnings, :decimal
     end

      change_table :projected_earnings do |t|
       t.change :earnings, :decimal
       t.change :ave_pe, :decimal
      end

      change_table :discount_cash_flows do |t|
       t.change :prev_cash_flow, :decimal
       t.change :growth_rate, :decimal
       t.change :cash_flow, :decimal
       t.change :discount_factor, :decimal
       t.change :total, :decimal
     end
  end

end


