require "csv"

namespace :plant_types do
  desc "TODO"
  task import: :environment do
    CSV.foreach(Rails.root.join('lib/data/plant_types.csv'), headers: true) do |row|
       PlantType.create!({
         scientific_name: row['scientific_name'],
         common_name: row['common_name'].to_s.titleize
         family: row['family'].to_s.titelize,
         duration: row['duration'].to_s.titelize,
         growth_habit: row['growth_habit'].to_s.titelize,
         growth_period: row['growth_period'].to_s.titelize,
         growth_rate: row['growth_rate'].to_s.titelize
       })
      puts "Created #{row['common_name'].to_s.titelize}"
    end
  end
end
