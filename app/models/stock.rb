class Stock < ActiveRecord::Base
  attr_accessible :div, :name, :pe, :price, :symbol

  validates :div, :name, :pe, :price, :symbol, :presence => true

  has_many :portfolio_memberships, :dependent => :destroy
  has_many :portfolios, :through => :portfolio_memberships

  #has_many :earnings, :dependent => :delete_all
end
