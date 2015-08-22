# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do 
	title = Faker::Company.bs
	body  = Faker::Lorem.paragraph
	created_at = Time.now - (rand(30)).days
	
	Post.create	(	{	title:      title,
						body:       body,
						created_at: created_at
					}
				)
end

print Cowsay::say("Created 100 posts.")