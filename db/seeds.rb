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

user = User.first
count = 0
File.readlines('db/iains_log_info').each do |string|
  info = string.split('|')

  date = info[0]
  type = info[1]
  ident = info[2]
  pic = info[3]
  sic = info[4]
  is_xc = false
  is_dual = false
  is_single_engine = true

  single_day_pic = info[5].to_f
  single_day_sic = info[6].to_f
  single_night_pic = info[7].to_f
  single_night_sic = info[8].to_f

  multi_day_pic = info[9].to_f
  multi_day_sic = info[10].to_f
  multi_night_pic = info[11].to_f
  multi_night_sic = info[12].to_f

  day_hours = single_day_pic +
              single_day_sic +
              multi_day_pic +
              multi_day_sic

  night_hours = single_night_pic +
                single_night_sic +
                multi_night_pic +
                multi_night_sic

  single_engine_hours = single_day_pic +
                        single_day_sic +
                        single_night_pic +
                        single_night_sic

  multi_engine_hours =  multi_day_pic +
                        multi_day_sic +
                        multi_night_pic +
                        multi_night_sic

  if !multi_engine_hours.blank? && multi_engine_hours > 0
    is_single_engine = false
  end

  pic_hours = single_day_pic +
              single_night_pic +
              multi_day_pic +
              multi_night_pic

  dual_hours = single_day_sic +
               single_night_sic +
               multi_day_sic +
               multi_night_sic

  if !dual_hours.blank? && dual_hours > 0
    is_dual = true
  end

  xc_hours = info[17].to_f +
             info[18].to_f +
             info[19].to_f +
             info[20].to_f

  if !xc_hours.blank? && xc_hours > 0
    is_xc = true
  end

  imc_hours = info[13]
  hood_hours = info[14]
  sim_hours = info[15]
  ifr_apprs = info[16]

  route = info[23]
  comments = info[24]

  if count < 20
    puts('single engine day PIC: ' + info[5])
    puts('single engine day SIC: ' + info[6])
    puts('is dual?: ' + is_dual.to_s)
    puts('is single?: ' + is_single_engine.to_s)
    puts("day hours: " + day_hours.to_s)
  end


  user.flights.create!(  date: date,
                         aircraft_type: type,
                         aircraft_ident: ident,
                         pic: pic,
                         sic: sic,
                         day_hours: day_hours,
                         night_hours: night_hours,
                         is_dual: is_dual,
                         is_single_engine: is_single_engine,
                         is_xc: is_xc,
                         imc_hours: imc_hours,
                         hood_hours: hood_hours,
                         sim_hours: sim_hours,
                         ifr_apprs: ifr_apprs,
                         route: route,
                         comments: comments
   )
   if count == 0
     print('|')
   end
   if count%10 == 0
     print('.')
   end
   if count%100 == 0
     print('|')
   end
   count += 1
end
