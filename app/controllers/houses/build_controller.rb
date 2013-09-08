class Houses::BuildController < ApplicationController
  include Wicked::Wizard

  steps :bees, :personal, :thanks

  def show
    @house = find_house        
    render_wizard
  end


  def update
    @house = find_house
    
    # set so that debugger inspection of step works...
    @current_step, @next_step, @steps = step, next_step, steps
    
    params[:house][:state] = step.to_s
    
    @house.update_attributes(params[:house])
    
    render_wizard @house # see wicked

  end


  def create
    @house = House.create
    redirect_to wizard_path(steps.first, :house_id => @house.id)
  end

  private

  def find_house
    House.where(:uuid => params[:house_id]).first
  end

end
