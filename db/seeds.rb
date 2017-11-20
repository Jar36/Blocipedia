# require 'random_data'
require 'faker'


# Create a member
 5.times do
  standard = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password(8)
 )
end

 # Create an admin user
  admin = User.create!(
  email: 'jromero45@hotmail.com', # Faker::Internet.email,
  password: '123456789', # Faker::Internet.password(8)
  role: 'admin'
 )

 users = User.all
 
 
 10.times do 
  Wiki.create!(
   title: Faker::Lorem.sentence,
   body: Faker::Lorem.paragraph(2),
   user: users.sample
   )
 end

 # Create an admin user
# admin = User.create!(
#   email:    'admin@example.com',
#   password: 'helloworld'
# )

# Create a member
# member = User.create!(
#   email:    'member@example.com',
#   password: 'helloworld'
# )

#users = User.all

 # Create Wikis
 
 #10.times do
 #  Wiki.create!(
 #    title:  RandomData.random_sentence,
 #    body:   RandomData.random_paragraph,
 #    user: users.sample
 #  )
 #end

 
 puts "#{User.count} users created"
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
