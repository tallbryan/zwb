class Earning < ActiveRecord::Base
  belongs_to :stock
  validates :div, :earnings, :pe, :sheq, :year, :presence => true
  attr_accessible :div, :earnings, :pe, :sheq, :year
  
end
