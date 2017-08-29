# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "rohan@gmail.com" , password: "rohanarora" , password_confirmation: "rohanarora" , first_name: "rohan" , last_name: "arora")
puts 'one user is created'
20.times do |post|
	Post.create(date: Date.today , rationale: "#{post} rationale content" , adjustment: "abc" ,Department: "ECE" , count: 1 , user_id: @user.id)
end

puts "20 posts have been created"
