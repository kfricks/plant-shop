class PlantTypesController < ApplicationController
  def index
    @plant_types = PlantType.all
  end

  def show
    @plant_type = PlantType.find(params[:id])
  end

  def search
    @response = PlantType.search_by_name params[:query]
    respond_to do |format|
      format.json { render "index" }
    end
  end

private

  def plant_type_params
    params.require(:plant_type).permit(:scientific_name, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
