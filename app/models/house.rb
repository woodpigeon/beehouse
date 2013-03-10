class House < ActiveRecord::Base
  
  attr_accessible :brand_id, :code, :style, :email
  
  # validates_presence_of :code
  # validates_uniqueness_of :code
 

  # def to_param
  #   self.code
  # end

  state_machine :initial => :s1 do

    # before_transition :parked => any - :parked, :do => :put_on_seatbelt
    # after_transition any => :parked do |vehicle, transition|
    #   vehicle.seatbelt = 'off'
    # end
    # around_transition :benchmark

    event :step1 do
      transition :s1 => :s2
    end

    event :done do
      transition :s2 => :s3
    end

    state :s2 do
      validates_presence_of :code
      validates_uniqueness_of :code
    end

    state :s3 do
      validates_presence_of :email
    end

  end

  # def put_on_seatbelt
  #   ...
  # end

  # def benchmark
  #   ...
  #   yield
  #   ...
  # end


end
