class HousesController < ApplicationController

  respond_to :html

  def create
    @house = House.new(params[:house])
    flash[:notice] = "Successfully created image."
    if @house.save
      flash[:notice] = "Bee house was created successfully created" 
      redirect_to imageable_path
    respond_with(@house)
  end

  def new
    @house = House.new
  end
end
