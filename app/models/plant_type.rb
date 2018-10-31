class PlantType < ApplicationRecord
  include PgSearch
  has_many :plants
  pg_search_scope :search_by_name, against: [:scientific_name, :common_name],
    using: { tsearch: {prefix: true} }
end
