# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product, :class => 'Product' do
    range_start 1
    range_end 1
    name "MyString"
  end
end
