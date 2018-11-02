class TradesController < ApplicationController
  def new
    @trade = Trade.new
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
  end

  def destroy
    # acts_as_paranoid gem prevents trade from being fully destroyed
  end

  def index
    @trades = Trade.all
  end

  def show
    @trade = Trade.find(params[:id])
  end

private

  def trade_params
    params.require(:trade).permit(:user_b_id)
  end
end
