class Stock < ActiveRecord::Base
  attr_accessible :div, :name, :pe, :price, :symbol

  validates :div, :name, :pe, :price, :symbol, :presence => true
end
