# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require 'faker'

ActiveRecord::Base.transaction do
  User.create!(first_name: "admin3000", email: "admin@admin.com", password:"tester")

  User.create!(first_name: "tester", email: "tester3000@tester.com", password: "tester")

  User.create!(first_name: "tester-author", email: "tester-author@tester.com", password: "tester")

  User.create!(first_name: "Super Admin", email: "superadmin@admin.com", password: "tester")

  10.times do
    plant = Plant.new
    plant_type.id = Plant_type.all.sample
    user = User.new
    user.id = User.all.sample
    # plant.image.attach(io: File.open(Rails.root.join('public/Enchantment-Book-Cover-Best-Seller1.jpg')), filename:"Enchantment-Book-Cover-Best-Seller1.jpg")
    plant.save!
  end

end
