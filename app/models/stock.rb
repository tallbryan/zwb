class Stock < ActiveRecord::Base
  attr_accessible :div, :name, :pe, :price, :symbol

  validates :div, :name, :pe, :price, :symbol, :presence => true

  #has_many :earnings, :dependent => :delete_all
end