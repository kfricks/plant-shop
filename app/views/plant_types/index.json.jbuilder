# look for something similar, not .@response
json.plant_types @response do |plant|
  json.(plant, :scientific_name, :id)
  json.common_name plant.common_name || "n/a"
  json.ignore_nil!
end

# make new template for users and put this there
# json.users do |user|
#   # somehow include last name below
#   json.name users.first_name
#   json.active users.active
# end
