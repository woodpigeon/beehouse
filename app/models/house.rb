class House < ActiveRecord::Base
  attr_accessible :brand_id, :code, :name, :style
  
  validates_presence_of :code

end
