class TradesController < ApplicationController
  def new
    @trade = Trade.new
    @plants = Plant.where.not(user_id: current_user.id)
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.user_a = current_user
    if @trade.save!
      redirect_to edit_trade_path(@trade)
    else
      render :new
    end
  end

  def create_by_owner
    @trade = Trade.new()
    @trade.user_b = User.find(params[:user_id])
    @trade.user_a = current_user
    @trade.plants = [Plant.find(params[:plant_id])]
    if @trade.save!
      redirect_to edit_trade_path(@trade)
    else
      render :new
    end
  end

  def update
    @trade = Trade.find(params[:id])
    @trade.plants = Plant.find(params[:plant_ids].split(","))
    # @trade.update(trade_params)
    if @trade.save
      flash.now[:success] = "Your trade has been saved."
      redirect_to trade_path(@trade)
    else
      render :edit
    end
  end

  def edit
    @trade = Trade.find(params[:id])
    @current_user_plants = format_plants(current_user.plants)
    @user_b_plants = format_plants(@trade.user_b.plants)

    @user_a_trade_plants = format_plants(@trade.plants.where(user: @trade.user_a))
    @user_b_trade_plants = format_plants(@trade.plants.where(user: @trade.user_b))
  end

  def destroy
    # acts_as_paranoid gem prevents trade from being fully destroyed
  end

  def index
    @trades = Trade.all
  end

  # def trade_template
  #   @fortrade = Plant.find(params[:id])
  #   # @response = Plant.search_by_name params[:query]
  #   respond_to do |format|
  #     format.json { render "edit" }
  #   end
  # end

  def show
    @trade = Trade.find(params[:id])
  end

private

  def trade_params
    params.require(:trade).permit(:user_b_id)
  end

  def format_plants(plants)
    plants.map do |plant|
      this_plant = {}
      this_plant[:id] = plant.id
      this_plant[:common_name] = plant.plant_type.common_name
      this_plant[:scientific_name] = plant.plant_type.scientific_name
      this_plant[:image] = rails_blob_path(plant.image, disposition: "attachment", only_path: true)
      this_plant[:description] = plant.description
      this_plant
    end
  end
end
