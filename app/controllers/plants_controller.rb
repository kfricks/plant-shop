class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
  end

  def edit
  end

private

  def plant_params
    params.require(:plant).permit(:scientific_name, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
  end

end
