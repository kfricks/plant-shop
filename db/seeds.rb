require 'faker'
require "csv"

ActiveRecord::Base.transaction do

 User.create!(
  first_name: 'Ashton',
  last_name: 'Smith',
  email: 'ashton@gmail.com',
  password: 'tester',
  locale: "Southeast",
  bio: "This is my cool bio",
  street1: Faker::Address.street_address,
  street2: Faker::Address.secondary_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  zip: Faker::Address.zip,
  country: "USA",
  phone: "000-000-0000",
  )

 User.create!(
  first_name: 'Morgan',
  last_name: 'Jones',
  email: 'morgan@gmail.com',
  password: 'tester',
  locale: "Southeast",
  bio: "Bio here",
  street1: "1 N. Main St.",
  street2: "Apt 1",
  city: "Greenville",
  state: "SC",
  zip: "90210",
  country: "USA",
  phone: "000-000-0000",
  )

  4.times do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      locale: "Southeast",
      bio: "Bio here",
      street1: "1 N. Main St.",
      street2: "Apt 1",
      city: "Greenville",
      state: "SC",
      zip: "90210",
      country: "USA",
      phone: "000-000-0000",
      password: "tester"
      )
  end

  CSV.foreach(Rails.root.join('lib/data/plant_types.csv'), headers: true) do |row|
    PlantType.create!({
     scientific_name: row['scientific_name'].to_s.titleize,
     common_name: row['common_name'].to_s.titleize,
     family: row['family'].to_s.titleize,
     duration: row['duration'].to_s.titleize,
     growth_habit: row['growth_habit'].to_s.titleize,
     growth_period: row['growth_period'].to_s.titleize,
     growth_rate: row['growth_rate'].to_s.titleize
     })
    print "📗"
  end


# USER1 PLANTS

plant = Plant.create!(
  plant_type: PlantType.find(148),
  user: User.find(1),
  description: "I love this guy. You'll love him, too!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/autumn-olive.jpg')),
  filename:"autumn-olive.jpg",
)


plant = Plant.create!(
  plant_type: PlantType.find(185),
  user: User.find(1),
  description: "I love this guy. You'll love him, too!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/quickstick.jpg')),
  filename:"quickstick.jpg",
)


plant = Plant.create!(
  plant_type: PlantType.find(271),
  user: User.find(1),
  description: "I love the look of these, but don't let their beauty fool you! They hurt to touch!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/prickly-pear.jpg')),
  filename:"prickly-pear.jpg"
)


plant = Plant.create!(
  plant_type: PlantType.find(379),
  user: User.find(1),
  description: "I grew this from a cutting, and now I want to share the love!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/Rosa_pisocarpa-clusterrose.jpg')),
  filename:"Rosa_pisocarpa-clusterrose.jpg"
)

plant = Plant.create!(
  plant_type: PlantType.find(270),
  user: User.find(1),
  description: "I love this guy. You'll love him, too!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/barbary-fig.jpg')),
  filename:"barbary-fig.jpg"
)


# USER2 PLANTS

plant = Plant.create!(
  plant_type: PlantType.find(153),
  user: User.find(2),
  description: "cool description"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/calif-yerba-santa.jpg')),
  filename:"calif-yerba-santa.jpg"
)


plant = Plant.create!(
  plant_type: PlantType.find(240),
  user: User.find(2),
  description: "I found this growing by the beach when I was on vacation in California."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/hawaiidesert-thorn.jpg')),
  filename:"hawaiidesert-thorn.jpg"
)

plant = Plant.create!(
  plant_type: PlantType.find(98),
  user: User.find(2),
  description: "I love this plant. I'm sure you will, too."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/maules-quince.jpg')),
  filename:"maules-quince.jpg"
)

plant = Plant.create!(
  plant_type: PlantType.find(371),
  user: User.find(2),
  description: "These look cool and are edible, too! :)"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/island-gooseberry.jpg')),
  filename:"island-gooseberry.jpg"
)




  # 60.times do
  #   plant = Plant.create!(
  #     plant_type: PlantType.all.sample,
  #     user: User.all.sample
  #   )

  #   plant.image.attach(
  #     io: File.open(Rails.root.join('public/snake.jpg')),
  #     filename:"snake.jpg"
  #   )

  #   print "🌿"
  # end

  puts "\nDone"

end
