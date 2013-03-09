class House < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: :slugged

  attr_accessible :brand_id, :code, :name, :style
  
  validates_presence_of :code

end
