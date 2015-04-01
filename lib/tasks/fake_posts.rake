namespace :post do
  desc 'Migrate data'
  task fake: :environment do
    1000.times do |i|
      post = Post.create!(author: Faker::Name.name, title: Faker::Company.name, text: Faker::Lorem.paragraph(2))
      10.times do |c|
        post.comments.create(body: Faker::Lorem.sentence, commenter: Faker::Name.name)
      end
    end
    puts '1000 posts created with comments'
  end
end