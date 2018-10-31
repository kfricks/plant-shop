require 'faker'
require "csv"

ActiveRecord::Base.transaction do

  4.times do
    User.create!(
      first_name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "tester")
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
