class Portfolio < ActiveRecord::Base
  attr_accessible :name, :stock_ids, :portfolio_ids


  validates :name, :presence => true

  has_many :memberships
  has_many :stocks, :through => :memberships

  #accepts_nested_attributes_for :memberships
  #accepts_nested_attributes_for :stocks
end
