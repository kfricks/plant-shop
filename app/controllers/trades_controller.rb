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
      @current_trader = @trade.user_b
      @other_trader = @trade.user_a
    else
      @proposer = false
      @current_trader = @trade.user_a
      @other_trader = @trade.user_b
    end

    @current_trader_plants = format_plants(@current_trader.plants - @trade.plants.where(user: @current_trader))
    @other_trader_plants = format_plants(@other_trader.plants - @trade.plants.where(user: @other_trader))
    @current_trader_trade_plants = format_plants(@trade.plants.where(user: @current_trader))
    @other_trader_trade_plants = format_plants(@trade.plants.where(user: @other_trader))
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
    .or(Trade.where(user_b: current_user))

    @trades_pending = @trades.where(status: "pending").sort.reverse
    @trades_completed = @trades.where(status: "approved").sort.reverse

  end

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
