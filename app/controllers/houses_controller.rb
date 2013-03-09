class HousesController < ApplicationController

  respond_to :html

  def show
    @house = House.find_by_code(params[:code])  
  end

  def edit
    @house = House.find(:code => params[:id])
  end

  def 

  def create
    @house = House.new()
    @house.code = params[:code]

    if @house.save!
      flash[:notice] = "Bee house was created successfully created" 
      redirect_to house_edit_path(@house)
    end
    respond_with(@house)
  end

  def new
    @house = House.new
    @house.code = params[:code]
  end

  def edit

  end

end
