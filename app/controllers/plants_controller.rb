class PlantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @plants = Plant.all
    # @plants = current_user.plants
    # make somethingthat says if a user ID is in URL, show that user's plants. otherwise, show all plants.
  end

  def show
     @plant = Plant.find(params[:id])
    # @plant = current_user.plants.find(params[:id])
  end

#renders form (get new)
  def new
    @plant = Plant.new
  end

#posts
  def create
    @plant = Plant.new(plant_params.merge(user: current_user))
    if @plant.save!
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

#renders form (get edit)
  def edit
    @plant = current_user.plants.find(params[:id])
  end

#posts
  def update
    @plant = current_user.plants.find(params[:id])
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
    params.require(:plant).permit(:plant_type_id, :description, :image)
  end

end
