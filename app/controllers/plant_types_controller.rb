class PlantTypesController < ApplicationController
  def index
    @plant_types = PlantType.all
    # @plant_type = PlantType.find(params[:id])
    # @common_name = plant_type.common_name
  end

  def show
    @plant_type = PlantType.find(params[:id])
  end

  def search
    @response = PlantType.search_by_name params[:query]
    respond_to do |format|
      format.json { render "index" }
    end
    #render json: response
  end

private

  def plant_type_params
    params.require(:plant_type).permit(:scientific_name, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
  end

  # trying to set it up for users
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
