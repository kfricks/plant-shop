# jbuilder for plants to be rendered without going through plant_types
json.plants @fortrade do |plant|
  json.(plant, :scientific_name, :id, :common_name, :family, :duration, :growth_habit, :growth_period, :growth_rate)
  json.common_name plant.plant_type.common_name || "n/a"
  json.ignore_nil!
end
