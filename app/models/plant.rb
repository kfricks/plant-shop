class Plant < ApplicationRecord
  belongs_to :plant_type
  belongs_to :user
end
