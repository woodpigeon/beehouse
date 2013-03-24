class House::BuildController < ApplicationController
  include Wicked::Wizard

  steps :step1, :step2, :step3

  def show
    @house = House.find(params[:house_id])
    render_wizard
  end


  def update
    @house = House.find(params[:house_id])
    @house.update_attributes(params[:house])
    render_wizard @product
  end


  def create
    @house = House.create
    redirect_to wizard_path(steps.first, :house_id => @house.id)
  end
end
