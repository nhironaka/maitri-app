# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

patients = [{:name=>"Toni T", :gender=>"M", :start_date=>"12-01-1991", :end_date=>"1-31-1992"},
            {:name=>"Cal H", :gender=>"M", :start_date=>"11-12-1993", :end_date=>"3-14-1996"}, 
            {:name=>"Aari L", :gender=>"F", :start_date=>"10-13-1999", :end_date=>"2-9-2001"}, 
            {:name=>"Steven Li", :gender=>"M", :start_date=>"9-12-1993", :end_date=>"10-21-1996"},
            {:name=>"Erika White", :gender=>"B", :start_date=>"7-4-2000", :end_date=>"12-11-2002"}
  	 ]

patients.each do |patient|
  Patient.create!(patient)
end