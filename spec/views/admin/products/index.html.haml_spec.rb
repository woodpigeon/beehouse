require 'spec_helper'

describe "admin/products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :range_start => 1,
        :range_end => 2,
        :name => "Name"
      ),
      stub_model(Product,
        :range_start => 1,
        :range_end => 2,
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin/products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
