# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

patients = [{:name=>"Toni T", :gender=>"M", :start_date=>"12-01-1991", :end_date=>"31-01-1992"},
            {:name=>"Cal H", :gender=>"M", :start_date=>"11-12-1993", :end_date=>"14-03-1996"}, 
            {:name=>"Aari L", :gender=>"F", :start_date=>"10-05-1999", :end_date=>"02-09-2001"}, 
            {:name=>"Steven Li", :gender=>"M", :start_date=>"09-12-1993", :end_date=>"10-04-1996"},
            {:name=>"Erika White", :gender=>"B", :start_date=>"07-04-2000", :end_date=>"12-11-2002"},
            {:name=>"James Bong", :gender=>"M", :start_date=>"12-01-2004", :end_date=>"01-11-2008"},
            {:name=>"Oscar Ramierez", :gender=>"T", :start_date=>"09-12-2015", :end_date=>"01-03-2016"}, 
            {:name=>"Skinny Cow", :gender=>"F", :start_date=>"03-03-2001", :end_date=>"12-09-2001"}, 
            {:name=>"Michael Fox", :gender=>"M", :start_date=>"02-12-1993", :end_date=>"10-11-1996"},
            {:name=>"Erika White", :gender=>"B", :start_date=>"01-04-2000", :end_date=>"07-11-2002"},
            {:name=>"Toni T", :gender=>"M", :start_date=>"12-01-1991", :end_date=>"31-01-1992"},
            {:name=>"Cal H", :gender=>"M", :start_date=>"11-12-1993", :end_date=>"14-03-1996"}, 
            {:name=>"Aari L", :gender=>"F", :start_date=>"10-05-1999", :end_date=>"02-09-2001"}, 
            {:name=>"Steven Li", :gender=>"M", :start_date=>"09-12-1993", :end_date=>"10-04-1996"},
            {:name=>"Erika White", :gender=>"B", :start_date=>"07-04-2000", :end_date=>"12-11-2002"},
            {:name=>"James Bong", :gender=>"M", :start_date=>"12-01-2004", :end_date=>"01-11-2008"},
            {:name=>"Oscar Ramierez", :gender=>"T", :start_date=>"09-12-2015", :end_date=>"01-03-2016"}, 
            {:name=>"Skinny Cow", :gender=>"F", :start_date=>"03-03-2001", :end_date=>"12-09-2001"}, 
            {:name=>"Michael Fox", :gender=>"M", :start_date=>"02-12-1993", :end_date=>"10-11-1996"},
            {:name=>"Erika White", :gender=>"B", :start_date=>"01-04-2000", :end_date=>"07-11-2002"}
  	 ]

patients.each do |patient|
  Patient.create!(patient)
end

users =    [{:username=>"userone", :password=>"password1", :email=>"userone@gmail.com", :password_confirmation=>"password1"},
            {:username=>"duplicate", :password=>"duplicate", :email=>"duplicate@gmail.com", :password_confirmation=>"duplicate"}, 
            {:username=>"susancanavan", :password=>"maitri", :email=>"SCanavan@maitrisf.org", :password_confirmation=>"maitri"}, 
            {:username=>"tessgurrey", :password=>"maitri", :email=>"TGurrey@maitrisf.org", :password_confirmation=>"maitri"}, 
  	 ]

users.each do |user|
  User.create!(user)
end