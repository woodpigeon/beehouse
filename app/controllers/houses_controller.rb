
class HousesController < ApplicationController

  respond_to :html

  def create
 
    @house = House.build_me(params[:house])
    
    respond_to do |format|
      if @house.save
        format.html { redirect_to house_build_index_path(@house.uuid)} 
      else
        format.html { render :action => "new" }
      end
    end

  end

  def new
    @house = House.new
  end

end
