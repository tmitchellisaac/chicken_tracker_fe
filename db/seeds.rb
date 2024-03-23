# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



@user = User.create!(email: "test@test.com", password: "test", password_confirmation: "test")
@isaac = User.create!(email: "tmitchellisaac@gmail.com", password: "password", password_confirmation: "password")


hooves_cut = SingleDayEvent.create!(start_time: Date.new(2024, 3, 22), name: "Hooves Cut", user_id: 2, notes: "Remember to bring cash", location: "Downtown Veterinary Office")
birthday = SingleDayEvent.create!(start_time: Date.new(2024, 3, 24), name: "Birthday", user_id: 2)
