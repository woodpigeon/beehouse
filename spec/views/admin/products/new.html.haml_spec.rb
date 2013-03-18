require 'spec_helper'

describe "admin/products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :range_start => 1,
      :range_end => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new admin_product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_products_path, "post" do
      assert_select "input#admin_product_range_start[name=?]", "admin_product[range_start]"
      assert_select "input#admin_product_range_end[name=?]", "admin_product[range_end]"
      assert_select "input#admin_product_name[name=?]", "admin_product[name]"
    end
  end
end
