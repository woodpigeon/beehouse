class House < ActiveRecord::Base
  
  attr_accessible :brand_id, :code, :style, :email, :postcode
  
  belongs_to :product

  before_create :generate_uuid

  def to_param
    self.uuid
  end

  protected

  def generate_uuid
    self.uuid = loop do
      random_uuid = SecureRandom.urlsafe_base64.downcase
      break random_uuid unless House.where(uuid: random_uuid).exists?
    end
  end

  #validates_presence_of :code
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

    event :reopen do
      transition :s3 => :s2
    end

    state :s2 do
      validates_presence_of :code
      validates_uniqueness_of :code
      # Note the ^ is a custom_error_message thing to prevent the attribute name from being prepended to the message
      validates_presence_of :product_id, :message => "^Sorry, we don't recognise this code. Please check it and try again."    end

    state :s3 do
      validates_presence_of :email, :postcode
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
