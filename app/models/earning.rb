class Earning < ActiveRecord::Base
  belongs_to :stock

  attr_accessible :div, :earnings, :pe, :sheq, :year
  
end
