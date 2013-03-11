class Stock < ActiveRecord::Base
  attr_accessible :div, :name, :pe, :price, :symbol, :portfolio_ids

  validates :div, :name, :pe, :price, :symbol, :presence => true

  has_many :memberships
  has_many :portfolios, :through => :memberships
  accepts_nested_attributes_for :portfolios

  #has_many :earnings, :dependent => :delete_all
end
