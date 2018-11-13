class Plant < ApplicationRecord
  acts_as_paranoid
  belongs_to :plant_type
  belongs_to :user
  has_many :trade_components
  has_many :trades, through: :trade_components
  has_one_attached :image
end
