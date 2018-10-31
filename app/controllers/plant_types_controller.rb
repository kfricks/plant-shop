class PlantTypesController < ApplicationController
  def index
    @plant_types = PlantType.all
  end

  def show
    @plant_type = PlantType.find(params[:id])
  end

  def search
    response = PlantType.search params[:q]
    render json: response

    @search_params = params[:search]
  end

private

  def plant_type_params
    params.require(:plant_type).permit(:scientific_name, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
  end

end
