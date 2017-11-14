require 'random_data'

 # Create an admin user
 admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld'
 )

# Create a member
 member = User.create!(
   email:    'member@example.com',
   password: 'helloworld'
 )

users = User.all

 # Create Wikis
 
 10.times do
   Wiki.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     user: users.sample
   )
 end

 
 puts "#{User.count} users created"
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
