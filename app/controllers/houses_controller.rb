
class String

  def brand_tag
    self.length > 1 ? self[0,2] : ""
  end

  def product_code
    self.length > 3 ? self[2,2] : ""
  end

  # def house_number
  #   self.length > 3 ? self[2,2] : ""
  # end

end

class HousesController < ApplicationController

  respond_to :html



  def create
 
    @house = House.new(params[:house])

    # Find the brand and product from the code
    unless @house.code.nil?
      @brand = Brand.find_by_tag(@house.code.brand_tag)
      unless @brand.nil?
        @product = @brand.products.where(:code => @house.code.product_code).first
        @house.product = @product unless @product.nil?
      end
    end

    respond_to do |format|
      if @house.step1
        format.html { redirect_to edit_house_path(@house)} 
      else
        format.html { render :action => "new" }
      end
    end

  end

  # we don't support show - only edit ?? unless its already been submitted?
  # we should hide email and postcode too, and only let the user edit
  # it though a guid
  def show
    redirect_to edit_house_url
  end

  def edit
    @house = find_house
    @house.reopen if @house.state == "s3"
  end

  def update
    @house = find_house
    unless @house.nil?
      @house.assign_attributes(params[:house])
      @house.done
    end
    respond_with @house, {:location => thanks_house_path(@house)}
  end

  def new
    @house = House.new
  end

  def thanks
    @house = find_house
  end

  private

  def find_house
    House.where(:uuid => params[:id]).first
  end

end
