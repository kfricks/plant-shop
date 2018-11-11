require "csv"

namespace :plant_types do
  desc "TODO"
  task import: :environment do
    CSV.foreach(Rails.root.join('lib/data/plant_types.csv'), headers: true) do |row|
       PlantType.create!({
         scientific_name: row['scientific_name'],
         common_name: row['common_name'].to_s.titleize,
         family: row['family'].to_s.titleize,
         duration: row['duration'].to_s.titleize,
         growth_habit: row['growth_habit'].to_s.titleize,
         growth_period: row['growth_period'].to_s.titleize,
         growth_rate: row['growth_rate'].to_s.titleize
       })
      puts "Created #{row['common_name'].to_s.titelize}"
    end
  end
end
