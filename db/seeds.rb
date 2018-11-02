require 'faker'
require "csv"

ActiveRecord::Base.transaction do

  # US only
  # Faker::Config.locale = 'en-US'
  # Faker::PhoneNumber.area_code #=> "201"
  # Faker::PhoneNumber.exchange_code #=> "208"

  4.times do
    User.create!(
      first_name: Faker::Name.name,
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
    PlantType.create! row.to_hash
    print "📗"
  end

  60.times do
    plant = Plant.new(
      plant_type: PlantType.all.sample,
      user: User.all.sample
    )

    # plant.image.attach(
    #   io: File.open(Rails.root.join('public/snake.jpg')),
    #   filename:"snake.jpg"
    # )

    print "🌿"
  end

  puts "\nDone"

end
