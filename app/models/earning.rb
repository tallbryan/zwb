class Earning < ActiveRecord::Base
  belongs_to :stock

  attr_accessible :div, :earnings, :pe, :sheq, :year
  attr_accessible :div, :name, :pe, :price, :symbol
end
