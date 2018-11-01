class Plant < ApplicationRecord
  acts_as_paranoid
  belongs_to :plant_type
  belongs_to :user
end
