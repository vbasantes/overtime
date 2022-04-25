# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "test20@test.com", password:"asdfasdf", password_confirmation:"asdfasdf", first_name:"Seed", last_name:"User")

100.times do |post|
  Post.create!(date: Date.today, rationale:"Hi! This is post #{post}", user: @user)
end

puts "100 posts have been created"
