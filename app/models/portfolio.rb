class Portfolio < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  has_many :stocks
end
