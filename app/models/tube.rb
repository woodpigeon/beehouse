class Tube < ActiveRecord::Base
  attr_accessible :bee_code, :colour_code, :house_id, :position
  #validates_presence_of :house_id, :position
  #validates_uniqueness_of :position, scope: :house_id

  belongs_to :house

end
