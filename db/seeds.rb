# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(	first_name: "z",
				last_name:  "z",
				email:      "z@z.com",
				password:	"z",
				password_confirmation: "z"
);


["Art", "Sports", "Dogs", "Technology", "Food"].each { |x| Category.create(title: x)}

["History", "Politics", "Architecture", "Psychology", "Geography"].each { |x| Tag.create(name: x)}
	
)
100.times do 
	title = Faker::Company.bs
	body  = Faker::Lorem.paragraph
	created_at = Time.now - (rand(30)).days
	category   = rand(5)
	Post.create	(	{	title:      title,
						body:       body,
						created_at: created_at,
						category_id: category,
						user_id:	 1
					}
				)
end

print Cowsay::say("Created 100 posts.")

# ["Ruby", "Rails", "Javascript", "HTML", "CSS", "Git", "Github", "SQL", "jQuery", "React.js", "APIs"].each do |tag|
# 	Category.create(name:tag)
# end
