class Houses::BuildController < ApplicationController
  include Wicked::Wizard

  steps :tubes, :bees, :personal, :thanks

  def show
    @house = find_house
    @p = params
    render_wizard
  end


  def update
    @house = find_house
    # @house.assign_attributes(params[:house])

    # set so that debugger inspection of step works
    @current_step = step
    @next_step = next_step
    @steps = steps

    params[:house][:state] = step.to_s
    
    @house.update_attributes(params[:house])
    # #{state_machine attribute}_event is important - it lets you set the state and still fire callbacks
    # tries to save here, will move to next step if valid model
    render_wizard @house

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
