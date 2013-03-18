class Product < ActiveRecord::Base
  attr_accessible :design_id, :brand_id, :name, :brand, :design, :range_start, :range_end
  validates_presence_of :design_id, :brand_id, :name, :range_start, :range_end
  validates_numericality_of :range_start, :range_end
  belongs_to :brand
  belongs_to :design
  has_many :houses

  def self.find_by_range(code)
      Product.where("range_start <= ? and range_end >= ?", code, code).first
  end

end
