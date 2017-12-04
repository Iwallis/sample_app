# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Iain Wallis",
             email: "theiainwallis@gmail.com",
             password:              "linden16",
             password_confirmation: "linden16",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

user = User.first
r = Random.new
idents = ['GBMO', 'GSDZ', 'GPFW', 'GTQQ', 'GKMY']
60.times do
  date = r.rand(2010...2017).to_s + '/' + r.rand(1..12).to_s + '/' + r.rand(1..30).to_s
  type = 'c-172'
  ident = idents[r.rand(0..4)]
  pic = 'Self'
  day_hours = r.rand(0.3...4.5)
  user.flights.create!( date: date,
                        aircraft_type: type,
                        aircraft_ident: ident,
                        pic: pic,
                        day_hours: day_hours
  )
end
