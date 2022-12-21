# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# websites = ['ryanckulp.com', 'cesll.co', 'pictureit.co', 'forkequity.com', 'uber.com']

puts "RUNNING SEEDS..."
user_count = User.count

def websites
    %w(stetsonblake.com csell.co pictureit.co forkequity.com uber.com)
end

def create_user_and_project!
    user = User.create!(email: Faker::Internet.email, password: 'password')
    user.projects.create!(title: "#{Faker::Company.name} Newsletter", description: Faker::Company.catch_phrase, website: websites.sample)  
end


5.times do
    create_user_and_project!
end


new_user_count = User.count - user_count
puts "CREATED #{new_user_count} users."