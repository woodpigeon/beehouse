class House < ActiveRecord::Base
  
  attr_accessible :brand_id, :code, :style, :email, :postcode
  attr_accessible :tubes_attributes, :accepted_terms, :state, :tubes

  belongs_to :product
  has_many :tubes

  accepts_nested_attributes_for :tubes

  before_create :generate_uuid

  validates :code, numericality: true, presence: true, uniqueness: true

  # Note the ^ is a custom_error_message thing to prevent the attribute name from being prepended to the message
  validates_presence_of :product_id, :message => "^Sorry, we don't recognise this code. Please check it and try again."    
  validates_presence_of [:postcode, :email], if: :on_personal?
  validates_email_format_of :email, if: :on_personal?
  validates :accepted_terms, :acceptance => {:accept => true}, if: :on_personal?

  COLOURS = %w(pink yellow lavender)
  MATERIALS = %w(leaf mud empty)
 
  # def on_tubes?
  #   state == 'tubes'
  # end

  def on_bees?
    state == 'bees'
  end

  def on_personal?
    state == 'personal'
  end

  def self.build_me(hash)

    house = House.new(hash)

    unless house.code.nil?

      # Find the brand and product from the code
      house.product = Product.find_by_range(house.code.to_i)


      nine_colors = create_initial_random_colours_array
      nine_materials = create_initial_random_materials_array 
    
      # add the 9 tubes with their
      9.times do |i|
        house.tubes.build(position: i, 
                          colour_code: nine_colors[i], 
                          bee_code: nine_materials[i])
      end
    end

    house

  end



  def to_param
    self.uuid
  end

  # Ugly convenience method to switch from the stored state to a step/event in the wizard.
  def state_sym
    return self.state.to_s.gsub(/_state$/, '').to_sym
  end

  protected

  def generate_uuid
    self.uuid = loop do
      random_uuid = SecureRandom.uuid()#urlsafe_base64.downcase
      #ecureRandom.hex(15)
      break random_uuid unless House.where(uuid: random_uuid).exists?
    end
  end


  private

  def self.create_initial_random_colours_array
    colours = []
    COLOURS.each do |c|
      colours.concat (1..3).map{ c }
    end
    colours.shuffle
  end

  def self.create_initial_random_materials_array
    materials = []
    MATERIALS.each do |material|
      materials.concat (1..3).map { material }  
    end
    materials.shuffle
  end

  # state_machine :initial => :s1 do

  #   event :code do
  #     transition :s1 => :s2
  #   end

  #   event :save_email do
  #     transition :s2 => :s3
  #   end

  #   event :yay do
  #     transition :s3 => :s4
  #   end

  #   event :reopen do
  #     transition :s3 => :s2
  #   end

  #   state :s2 do
  #     validates_presence_of :code
  #     validates_uniqueness_of :code
  #     validates_numericality_of :code
  #     # Note the ^ is a custom_error_message thing to prevent the attribute name from being prepended to the message
  #     validates_presence_of :product_id, :message => "^Sorry, we don't recognise this code. Please check it and try again."    
  #   end

  #   state :s3 do
  #     validates_presence_of :email
  #     validates_email_format_of :email
  #   end

  #   state :s4 do
  #     p "validation"
  #     validates_presence_of :postcode
  #     validates_length_of :postcode, maximum: 100, minimum:4
  #   end

  # end

  


end
