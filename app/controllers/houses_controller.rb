class HousesController < ApplicationController

  respond_to :html
#     respond_with(@house, :location => edit_house_path(@house))

#   end


# def create

#     @house = House.new(params[:house])

#     respond_to do |format|
#       if @house.save
#         format.html { redirect_to edit_house_path(@house)} #, notice: 'house was successfully created.' }
#       else
#         format.html { render :action => "new" }
#       end
#     end
# end


def create

    @house = House.new(params[:house])
    @house.save
    respond_with @house, {:location => edit_house_path(@house) }
      
end

  def edit
    @house = House.where(:id => params[:id]).first
  end

  # def update
  #   @house = House.find(params[:id])

  #   respond_to do |format|
  #     if @house.update_attributes(params[:house])
  #       format.html { redirect_to thanks_house_path(@house)}#, notice: 'House was successfully updated.' }
  #     else
  #       format.html { render action: "edit" }
  #     end
  #   end
  # end


  def update
    @house = House.find(params[:id])
    @house.update_attributes(params[:house])
    respond_with @house, {:location => thanks_house_path(@house)}
  end

  # # def create
  # #   puts "!!!!!!!here"

  # #   @house = House.new(params[:house])
    
  # #   if @house.save!
  # #     flash[:notice] = "Bee house was created successfully created" 
  # #     redirect_to house_edit_path(@house)
  # #   end
  # #   respond_with(@house)
  # # end

  def new
    @house = House.new
    #@house.code = params[:code]
  end

  # def edit

  # end

end
