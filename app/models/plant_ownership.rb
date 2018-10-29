class PlantOwnership < ApplicationRecord
  belongs_to :user
  belongs_to :plant_type

  has_one_attached :image
end
