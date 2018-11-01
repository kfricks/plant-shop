class TradesController < ApplicationController
  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save!
      redirect_to trades_show_path
    else
      render :new
    end
  end

  def update
    @trade = Trade.find(params[:id])
    @trade.update(trade_params)

    if @trade.save
      flash.now[:success] = "Your trade has been saved."
      redirect_to trades_show_path
    else
      render :edit
    end
  end

  def edit
    @book = Trade.find(params[:id])
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
    params.require(:trade).permit(:user_a, :user_b, :shipping_label_user_a, :shipping_label_user_b, :status)
  end

end
