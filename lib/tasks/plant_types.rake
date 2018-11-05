require "csv"

namespace :plant_types do
  desc "TODO"
  task import: :environment do
    CSV.foreach(Rails.root.join('lib/data/plant_types.csv'), headers: true) do |row|
      # PlantType.create! row.to_hash
       PlantType.create! row.to_hash.try(:titleize)
      puts "Created #{row['common_name']}"
    end
  end

end
