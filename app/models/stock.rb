class Stock < ActiveRecord::Base
  attr_accessible :ten_year_growth, :guess_growth, :div, :name, 
                  :pe, :price, :symbol, :earnings_attributes, :earning,
                  :buy_at, :dollar_difference, :difference, :market_value,
                  :buy_decision, :portfolio_ids

  validates :div, :name, :pe, :price, :symbol, :presence => true

  has_many :earnings, :dependent => :delete_all
  has_many :projected_earnings
  has_many :discount_cash_flows 

  has_many :memberships
  has_many :portfolios, :through => :memberships
  accepts_nested_attributes_for :portfolios

  accepts_nested_attributes_for :earnings,  :allow_destroy => true
  #has_many :earnings, :dependent => :delete_all
end
