# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

venues = Venue.create([ 
	{name: "9:30 Club",
		url: "http://www.930.com",
		city: "Washington, DC"
	}
])
concerts = Concert.create([
	{headliner: "Metric",
		headliner_pic: "https://upload.wikimedia.org/wikipedia/commons/4/46/Metric_-_Live_at_Coachella_Music_Festival_2013.jpg",
		headliner_url: "http://www.ilovemetric.com/",
		date: 20151230,
		openers_etc: "Openers are Centimeter and Millimeter. Doors at 7 pm, show starts at 8.",
		buy: "http://www.google.com",
		price: 30,
		venue_id: 1}
])