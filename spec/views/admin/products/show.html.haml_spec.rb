require 'spec_helper'

describe "admin/products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :range_start => 1,
      :range_end => 2,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Name/)
  end
end
