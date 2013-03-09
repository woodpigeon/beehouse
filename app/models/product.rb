class Product < ActiveRecord::Base
  attr_accessible :design_id, :name, :code, :brand, :design
  validates_presence_of :design_id, :name, :code
  #validates_uniqueness_of :name, scope: :brand

  belongs_to :brand
  belongs_to :design
  has_many :houses

end
