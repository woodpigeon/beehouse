require 'spec_helper'

describe "Houses" do

  describe "GET /", :type => :feature do

    before :each do 
      FactoryGirl.create(:product)
    end
    
    it "renders home page correctly" do
      get root_path
      response.status.should be(200)
      response.body.should include("Enter your bee house's code here")
    end

    it "displays correct message if invalid code entered" do
      visit root_path
      click_button "Go"
      page.should have_content("Code is not a number")
      page.should have_content("Code can't be blank")
      page.should have_content("Sorry, we don't recognise this code. Please check it and try again.")
    end

    it "displays correct message if not recognised" do
      visit root_path
      fill_in 'house_code', :with => "100000000000"
      click_button "Go"
      page.should have_content("Sorry, we don't recognise this code")
    end

    it "displays tubes if code recognised" do
      visit root_path
      fill_in 'house_code', :with => "1000"
      click_button "Go"
      page.should have_content("What's going on in your tubes?")

      house = House.where(:code => 1000).first
      house.should_not be_nil

      expect(current_path).to eq(File.join(house_build_index_path(house.uuid), "bees"))
    end

  end

end
