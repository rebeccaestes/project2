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

venues = Venue.create([
	{name: "Bowery Ballroom",
		url: "http://www.boweryballroom.com",
		city: "New York, NY"
	}
])

venues = Venue.create([
	{name: "Ram's Head Live",
		url: "http://www.ramsheadlive.com",
		city: "Baltimore, MD"
	}
])

venues = Venue.create([
	{name: "The Tiki Hut",
		url: "http://www.google.com",
		city: "Papeete, Tahiti"
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
		venue_id: 1,
		user_id: 1}
])

concerts = Concert.create([
	{headliner: "Dragonette",
		headliner_pic: "http://blog.promotion-us.com/blog.promotion-us.com/html/wp-content/uploads/Dragonette_photobyKristinVicari_2.jpg",
		headliner_url: "http://www.dragonetteonline.com/",
		date: 20151130,
		openers_etc: "Doors at 7 pm, show starts at 8.",
		buy: "https://www.ticketfly.com/purchase/event/961003",
		price: 30,
		venue_id: 2,
		user_id: 1}
])

concerts = Concert.create([
	{headliner: "The Hula Collective",
		headliner_pic: "http://www.cypressfineart.com/artists/l_schory/images2/20100123-7-HulaGirl.jpg",
		headliner_url: "http://.boraboraisland.com",
		date: 20151212,
		openers_etc: "Openers are The Pineapples. 21+.",
		buy: "www.boraboraisland.com",
		price: 30,
		venue_id: 3,
		user_id: 1}
])

user = User.create([
	{email: "estes.rebecca@gmail.com",
	password: "drowssap"}
])
