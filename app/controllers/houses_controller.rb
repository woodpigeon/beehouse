class HousesController < ApplicationController

  respond_to :html

  # def create
  #   @house = House.new(params[:house])
  #   @house.save
  #   respond_with @house, {:location => edit_house_path(@house) }
  # end

  def create
 
    @house = House.new(params[:house])
    

    respond_to do |format|
      if @house.step1
        format.html { redirect_to edit_house_path(@house)} #, notice: 'house was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @house = House.where(:id => params[:id]).first
  end

  def update
    @house = House.find(params[:id])
    @house.assign_attributes(params[:house])
    @house.done
    respond_with @house, {:location => thanks_house_path(@house)}
  end

  def new
    @house = House.new
  end

  def thanks
    @house = House.find(params[:id])
  end

end
