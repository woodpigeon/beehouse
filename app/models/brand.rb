class Brand < ActiveRecord::Base
  attr_accessible :logo, :name, :tag
  validates_presence_of :logo, :name, :tag
  validates_uniqueness_of :tag, :name
  
  has_many :products
  
end
