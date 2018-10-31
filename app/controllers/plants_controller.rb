class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

#renders form (get new)
  def new
    @plant = Plant.new
  end

#posts
  def create
    # not positive this is right
    @plant = Plant.find(params[:id])
    @plant.create(plant_params.merge(user: current_user))
  end

#renders form (get edit)
  def edit
    @plant = Plant.find(params[:id])
  end

#posts
  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params.merge(user: current_user))
      flash.now[:success] = "Your plant has been saved."
      # redirect_to CURRENTUSERSPLANTS
    else
      render :edit
    end
  end

  def destroy
  end

private

  def plant_params
    # params.require(:plant).permit(:scientific_name, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
    params.require(:plant).permit(:plant_type_id, :description)
  end

end
