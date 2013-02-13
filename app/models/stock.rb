class Stock < ActiveRecord::Base
  attr_accessible :div, :name, :pe, :price, :symbol, :earnings_attributes, :earning

  validates :div, :name, :pe, :price, :symbol, :presence => true

  has_many :earnings,  :dependent => :delete_all

  accepts_nested_attributes_for :earnings
end
