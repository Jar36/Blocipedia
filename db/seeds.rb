require 'random_data'
 # Create Wikis
 10.times do
   Wiki.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 wikis = Wiki.all
  # Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 
 puts "#{User.count} users created"
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
