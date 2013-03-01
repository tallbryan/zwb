class ProjectedEarning < ActiveRecord::Base
  belongs_to :stock
  attr_accessible :ave_pe, :earnings, :year
end
