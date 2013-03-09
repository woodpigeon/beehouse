class House < ActiveRecord::Base
  
  attr_accessible :brand_id, :code, :style, :email
  
  validates_presence_of :code
  validates_uniqueness_of :code
  
  # def to_param
  #   self.code
  # end

end
