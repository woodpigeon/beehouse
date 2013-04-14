require "spec_helper"

describe HousesController do
  
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("houses#new")
    end

  end
end
