class Design < ActiveRecord::Base
  attr_accessible :name, :vertical_tubes, :horizontal_tubes
  validates_presence_of :name, :vertical_tubes, :horizontal_tubes
  validates_numericality_of :vertical_tubes, :horizontal_tubes
  validates_uniqueness_of :name
  has_many :products

end
