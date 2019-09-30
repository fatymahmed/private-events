# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i| 
  User.create!(name: "User #{i + 1}", email: "User#{i + 1}@gmail.com")
end

puts "10 users created"

users = User.limit(3)

users.each do |user|
  5.times do |i|
    user.events.create!(description: "Description #{i + 1}", date: Date.today, location: "Location #{i + 1}")
  end
end

puts "15 events created"

other_users = User.offset(3)

events = Event.limit(3)

events.each do |event| 
  other_users.each do |user|
    Attendance.create!(attendee: user, attended_event: event)
  end
end

puts "21 events created"


