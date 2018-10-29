class TradeComponent < ApplicationRecord
  belongs_to :trade
  belongs_to :plant_ownership
end
