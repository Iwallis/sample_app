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
100.times do
  date = r.rand(2010...2017).to_s + '/' + r.rand(1..12).to_s + '/' + r.rand(1..30).to_s
  type = 'C-172'
  ident = idents[r.rand(0..4)]
  pic = 'Self'
  random_number = r.rand(1...10)
  if random_number < 3
    is_dual = true
    sic = "Self"
    pic = "Bob McBob"
  end
  random_number = r.rand(1...10)
  if random_number < 3
    is_xc = true
    route = 'CYAB - CYZY - CYAB'
  end
  random_number = r.rand(1...10)
  if random_number < 2
    is_single_engine = false
    type = 'PA-44'
    ident = 'FHDP'
  end
  if random_number<9 # then flight is day
    day_hours = r.rand(0.8..1.3)
    random_number = r.rand(1...10)
    if random_number<7
      day_hours += r.rand(-0.2..0.2)
    else
      day_hours += r.rand(-0.3..3.2)
    end
  else
    night_hours = r.rand(0.8..1.3)
    random_number = r.rand(1...10)
    if random_number<7
      night_hours += r.rand(-0.2..0.2)
    else
      night_hours += r.rand(-0.3..3.2)
    end
  end
  user.flights.create!( date: date,
                        aircraft_type: type,
                        aircraft_ident: ident,
                        pic: pic,
                        sic: sic,
                        day_hours: day_hours,
                        night_hours: night_hours,
                        is_dual: is_dual,
                        is_single_engine: is_single_engine
  )
end
