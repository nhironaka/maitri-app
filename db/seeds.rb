# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

patients = [{:two=>"Toni T", :nine=>"M", :sixteen=>"12-01-1991", :seventeen=>"31-01-1992"},
            {:two=>"Cal H", :nine=>"M", :sixteen=>"11-12-1993", :seventeen=>"14-03-1996"}, 
            {:two=>"Aari L", :nine=>"F", :sixteen=>"10-05-1999", :seventeen=>"02-09-2001"}, 
            {:two=>"Steven Li", :nine=>"M", :sixteen=>"09-12-1993", :seventeen=>"10-04-1996"},
            {:two=>"Erika White", :nine=>"B", :sixteen=>"07-04-2000", :seventeen=>"12-11-2002"},
            {:two=>"James Bong", :nine=>"M", :sixteen=>"12-01-2004", :seventeen=>"01-11-2008"},
            {:two=>"Oscar Ramierez", :nine=>"T", :sixteen=>"09-12-2015", :seventeen=>"01-03-2016"}, 
            {:two=>"Skinny Cow", :nine=>"F", :sixteen=>"03-03-2001", :seventeen=>"12-09-2001"}, 
            {:two=>"Michael Fox", :nine=>"M", :sixteen=>"02-12-1993", :seventeen=>"10-11-1996"},
            {:two=>"Erika White", :nine=>"B", :sixteen=>"01-04-2000", :seventeen=>"07-11-2002"},
            {:two=>"Toni T", :nine=>"M", :sixteen=>"12-01-1991", :seventeen=>"31-01-1992"},
            {:two=>"Cal H", :nine=>"M", :sixteen=>"11-12-1993", :seventeen=>"14-03-1996"}, 
            {:two=>"Aari L", :nine=>"F", :sixteen=>"10-05-1999", :seventeen=>"02-09-2001"}, 
            {:two=>"Steven Li", :nine=>"M", :sixteen=>"09-12-1993", :seventeen=>"10-04-1996"},
            {:two=>"Erika White", :nine=>"B", :sixteen=>"07-04-2000", :seventeen=>"12-11-2002"},
            {:two=>"James Bong", :nine=>"M", :sixteen=>"12-01-2004", :seventeen=>"01-11-2008"},
            {:two=>"Oscar Ramierez", :nine=>"T", :sixteen=>"09-12-2015", :seventeen=>"01-03-2016"}, 
            {:two=>"Skinny Cow", :nine=>"F", :sixteen=>"03-03-2001", :seventeen=>"12-09-2001"}, 
            {:two=>"Michael Fox", :nine=>"M", :sixteen=>"02-12-1993", :seventeen=>"10-11-1996"},
            {:two=>"Erika White", :nine=>"B", :sixteen=>"01-04-2000", :seventeen=>"07-11-2002"}
  	 ]

patients.each do |patient|
  Patient.create!(patient)
end

users =    [{:username=>"userone", :password=>"password1", :email=>"userone@gmail.com", :password_confirmation=>"password1"},
            {:username=>"duplicate", :password=>"duplicate123", :email=>"duplicate@gmail.com", :password_confirmation=>"duplicate123"}, 
            {:username=>"susancanavan", :password=>"maitri123", :email=>"SCanavan@maitrisf.org", :password_confirmation=>"maitri123"}, 
            {:username=>"tessgurrey", :password=>"maitri123", :email=>"TGurrey@maitrisf.org", :password_confirmation=>"maitri123"}, 
  	 ]

users.each do |user|
  User.create!(user)
end