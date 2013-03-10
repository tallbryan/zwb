class DiscountCashFlow < ActiveRecord::Base
  belongs_to :stock
  attr_accessible :cash_flow, :discount_factor, :growth_rate, :prev_cash_flow, :total, :year
end
