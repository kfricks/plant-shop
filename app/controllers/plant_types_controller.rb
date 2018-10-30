class PlantTypesController < ApplicationController
  def index
    @plant_types = PlantType.all
  end

  def show
    @plant_type = PlantType.find(params[:id])
  end

private

  def plant_type_params
    params.require(:plant_type).permit(:scientific_name, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
  end

end