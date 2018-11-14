class TradesController < ApplicationController
  before_action :authenticate_user!
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
    @trade.plants = Plant.where(id: params[:trade_ids])
    if params[:status] == "approved"
      @trade.status = "approved"
      @trade.save!
      render status: 200
    else
      render status: 200
    end

  end

  def edit
    @trade = Trade.find(params[:id])
    if current_user == @trade.user_b 
      @proposer = true
      @other_trader = @trade.user_a
    else
      @proposer = false
      @other_trader = @trade.user_b
    end

    @current_user_plants = format_plants(current_user.plants - @trade.plants.where(user: @trade.user_a))
    @user_b_plants = format_plants(@trade.user_b.plants - @trade.plants.where(user: @trade.user_b))
    @user_a_trade_plants = format_plants(@trade.plants.where(user: @trade.user_a))
    @user_b_trade_plants = format_plants(@trade.plants.where(user: @trade.user_b))
  end

  def approve
    @trade = Trade.find(params[:id])
    @trade.status = 'approved'
    @trade.save!
    UpdatePlantsAfterTradeJob.perform_now(@trade)
    redirect_to trade_path(@trade) 
  end

  def destroy
    # acts_as_paranoid gem prevents trade from being fully destroyed
  end

  def index
    @trades = Trade.where(user_a: current_user)
    # @proposed_trades = Trade.where(user_b: current_user)
    # @trade.user_b = User.find(params[:user_id])
    # @trade = Trade.find(params[:id])
    # @current_user_plants = format_plants(current_user.plants - @trade.plants.where(user: @trade.user_a))
    
    # @user_b_plants = format_plants(@trades.user_b.plants - @trade.plants.where(user: @trade.user_b))
    # @user_a_trade_plants = format_plants(@trades.plants.where(user: @trade.user_a))
    # @user_b_trade_plants = format_plants(@trades.plants.where(user: @trade.user_b))
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
    @current_user_plants = current_user.plants - @trade.plants.where(user: @trade.user_a)
    @user_b_plants = @trade.user_b.plants - @trade.plants.where(user: @trade.user_b)
    @user_a_trade_plants = @trade.plants.where(user: @trade.user_a)
    @user_b_trade_plants = @trade.plants.where(user: @trade.user_b)
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
