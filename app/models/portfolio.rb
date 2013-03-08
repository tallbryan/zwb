class Portfolio < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true

  has_many :porfolio_memberships
  has_many :stocks, :through => :porfolio_memberships

  accepts_nested_attributes_for :stocks
end
