require 'faker'
require "csv"

ActiveRecord::Base.transaction do

  user = User.create!(
    first_name: 'Ashton',
    last_name: 'Rooney',
    email: 'ashton@gmail.com',
    password: 'tester',
    locale: "Southeast",
    bio: "Plants are a part of who I am. They center me.",
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: "USA",
    phone: "000-000-0000"
  )

  user.avatar.attach(
    io: File.open(Rails.root.join('public/avatar-hairup.jpg')),
    filename:"avatar-hairup.jpg"
  )

  user = User.create!(
    first_name: 'Morgan',
    last_name: 'Jones',
    email: 'morgan@gmail.com',
    password: 'tester',
    locale: "Southeast",
    bio: "What is a weed? A plant whose virtues have never been discovered. -Ralph Waldo Emerson",
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: "USA",
    phone: "000-000-0000"
  )

  user.avatar.attach(
    io: File.open(Rails.root.join('public/guy-backpack.jpg')),
    filename:"guy-backpack.jpg"
  )

  user = User.create!(
    first_name: 'Logan',
    last_name: 'Smith',
    email: 'logan@gmail.com',
    password: 'tester',
    locale: "Southeast",
    bio: "Growing plants is my passion.",
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: "USA",
    phone: "000-000-0000"
  )

  user.avatar.attach(
    io: File.open(Rails.root.join('public/avatar-girl-braid.jpg')),
    filename:"avatar-girl-braid.jpg"
  )

  # 4.times do
  #   User.create!(
  #     first_name: Faker::Name.first_name,
  #     last_name: Faker::Name.last_name,
  #     email: Faker::Internet.email,
  #     locale: "Southeast",
  #     bio: "Bio here",
  #     street1: "1 N. Main St.",
  #     street2: "Apt 1",
  #     city: "Greenville",
  #     state: "SC",
  #     zip: "90210",
  #     country: "USA",
  #     phone: "000-000-0000",
  #     password: "tester"
  #   )
  # end

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

# ID 148
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Elaeagnus Umbellata"),
  user: User.first,
  description: "I love this guy. You'll love him, too!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/autumn-olive.jpg')),
  filename:"autumn-olive.jpg",
)

# ID 185
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Gliricidia Sepium"),
  user: User.first,
  description: "I love this guy. You'll love him, too!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/quickstick.jpg')),
  filename:"quickstick.jpg",
)

# ID 478
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Tillandsia Usneoides"),
  user: User.first,
  description: "Spanish moss looks so cool and is so easy to grow."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/spanish-moss-478.jpg')),
  filename:"spanish-moss-478.jpg",
)

# ID 271
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Opuntia Polyacantha"),
  user: User.first,
  description: "I love the look of these, but don't let their beauty fool you! They hurt to touch!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/prickly-pear.jpg')),
  filename:"prickly-pear.jpg"
)

# ID 379
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Rosa Pisocarpa"),
  user: User.first,
  description: "I grew this from a cutting, and now I want to share the love!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/Rosa_pisocarpa-clusterrose.jpg')),
  filename:"Rosa_pisocarpa-clusterrose.jpg"
)

# ID 270
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Opuntia Ficus Indica"),
  user: User.first,
  description: "I love this guy. You'll love him, too!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/barbary-fig.jpg')),
  filename:"barbary-fig.jpg"
)


# USER2 PLANTS

# ID 153
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Eriodictyon Californicum"),
  user: User.second,
  description: "I found this growing in the forest and took a cutting home. Look at her now!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/calif-yerba-santa.jpg')),
  filename:"calif-yerba-santa.jpg"
)

# ID 240
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Lycium Sandwicense"),
  user: User.second,
  description: "I found this growing by the beach when I was on vacation in California."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/hawaiidesert-thorn.jpg')),
  filename:"hawaiidesert-thorn.jpg"
)

# ID 307
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Piper Methysticum"),
  user: User.second,
  description: "Looks better than it tastes. Trust me."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/kava-307.jpg')),
  filename:"kava-307.jpg"
)

# ID 98
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Chaenomeles Japonica"),
  user: User.second,
  description: "I love this plant. I'm sure you will, too."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/maules-quince.jpg')),
  filename:"maules-quince.jpg"
)

# ID 327
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Pritchardia Affinis"),
  user: User.second,
  description: "I love the look of these. Luckily, I have a big tree right outside my window!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/hawaii-pritchardia-327.jpg')),
  filename:"hawaii-pritchardia-327.jpg"
)

# ID 380
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Rosmarinus Officinalis"),
  user: User.second,
  description: "Fresh rosemary is infinitely better than the dried kind. And it looks pretty cool, too."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/rosemary-380.jpg')),
  filename:"rosemary-380.jpg"
)

# ID 371
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Ribes Viburnifolium"),
  user: User.second,
  description: "These look cool and are edible, too! :)"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/island-gooseberry.jpg')),
  filename:"island-gooseberry.jpg"
)

# User 3 plants
# ID 165
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Ferocactus Wislizeni"),
  user: User.third,
  description: "These are awesome."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/candy-barrell-cactus.jpg')),
  filename:"candy-barrell-cactus.jpg"
)

# ID 183
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Ginkgo Biloba"),
  user: User.third,
  description: "These really help to make my home feel like a peaceful space."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/maidenhair-tree.jpg')),
  filename:"candy-maidenhair-tree.jpg"
)

# ID 344
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Pyrus Calleryana"),
  user: User.third,
  description: "I had one of these by my driveway growing up. They always remind me of home."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/callery-pear-344.jpg')),
  filename:"callery-pear-344.jpg"
)

# ID 441
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Salvia Dorrii"),
  user: User.third,
  description: "This purple sage is super low maintenance and can survive anything! Seriously. I haven't watered mine in months."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/purple-sage-441.jpg')),
  filename:"purple-sage-441.jpg"
)

# ID 268
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Opuntia Dillenii"),
  user: User.third,
  description: "The supermodel of the cactus world, this plant was made for pinterest."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/erect-pricklypear-268.jpg')),
  filename:"erect-pricklypear-268.jpg"
)

# ID 274
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Osmunda Regalis"),
  user: User.third,
  description: "I often find these classic beauties on hikes."
)

plant.image.attach(
  io: File.open(Rails.root.join('public/royal-fern-274.jpg')),
  filename:"royal-fern-274.jpg"
)

# ID 449
plant = Plant.create!(
  plant_type: PlantType.find_by_scientific_name("Simmondsia Chinensis"),
  user: User.third,
  description: "I grew this from a cutting. Look at her now!"
)

plant.image.attach(
  io: File.open(Rails.root.join('public/jojoba-449.jpg')),
  filename:"jojoba-449.jpg"
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
