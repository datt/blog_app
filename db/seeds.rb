# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |index|
  post = Post.create(title: Faker::Name.title,author: Faker::Name.name, text: Faker::Lorem.paragraph(2))
  rand(4).times do |c|
    post.comments.create(body: Faker::Lorem.sentence, commenter: Faker::Name.name)
  end
end
puts "Fake Data created!"