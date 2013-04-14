

FactoryGirl.define do

  factory :design do
    name 'Initial design'
    vertical_tubes 3
    horizontal_tubes 3 
  end

  factory :brand, :class => 'Brand' do
    name 'Bristol Zoo'
    logo 'bz.png' 
    tag "BZ"
  end

  factory :product, :class => 'Product' do
    name 'Model 1'
    brand 
    design
    range_start 1000
    range_end 1999
  end


end

