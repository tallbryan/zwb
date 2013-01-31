class Stock < ActiveRecord::Base
  attr_accessible :div, :name, :pe, :price, :symbol
end
