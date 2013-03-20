class House < ActiveRecord::Base
  
  attr_accessible :brand_id, :code, :style, :email, :postcode, :accepted_terms
  
  belongs_to :product
  has_many :tubes

  before_create :generate_uuid

  def self.build_me(hash)
    house = House.new(hash)

    # Find the brand and product from the code
    unless house.code.nil?
      product = Product.find_by_range(house.code.to_i)
      house.product = product unless product.nil?

      house.tubes = []

      colors = []
      colors.concat (1..3).map{ 'pink'}
      colors.concat (1..3).map{ 'yellow'}
      colors.concat (1..3).map{ 'lavender'}
      colors.shuffle!
    
      # add the tubes
      (0..8).each do |i|
        t =Tube.new(position: i, colour_code: colors[i], bee_code: 'empty')
        house.tubes << t
        puts t.inspect
      end
    end
    house

  end

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

  state_machine :initial => :s1 do

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
      validates_numericality_of :code
      # Note the ^ is a custom_error_message thing to prevent the attribute name from being prepended to the message
      validates_presence_of :product_id, :message => "^Sorry, we don't recognise this code. Please check it and try again."    end

    state :s3 do
      validates_presence_of :email, :postcode
      validates_email_format_of :email

    end

  end


end
