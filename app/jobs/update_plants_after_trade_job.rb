class UpdatePlantsAfterTradeJob < ApplicationJob
  
  queue_as :default

  def perform(trade)
    user_a = trade.user_a
    user_b = trade.user_b
    all_plants = trade.trade_components.map(&:plant)

    all_plants.each do |plant|
      if plant.user == user_a
        plant.user = user_b
      else
        plant.user = user_a
      end
      plant.save!
    end
  end
end