# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts '### SEED START ###'

#  Admin User
puts '### USERS ### '
puts 'Creating admin user...'
User.create!({ email: 'admin@gmail.com', first_name: 'Admin', last_name: 'Root', password: '12345678',
               password_confirmation: '12345678' })

puts 'Creating normal users...'
20.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@gmail.org"
  password = 'password'
  User.create!({ first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password })
end

puts '### POSTS ### '
puts 'Creating posts...'

users = User.allT
25.times do |_n|
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!({ body: content }) }
end

puts '### COMMENTS ### '
puts 'Creating comments...'
posts = Post.all
10.times do |_n|
  content = Faker::Lorem.sentence
  posts.each { |post| post.comments.create!({ user: post.user, body: content }) }
end

puts '### TRAININGS ### '
puts 'Creating trainings...'
12.times do |_n|
  title = "Training #{Faker::Number.digit}"
  description = Faker::Lorem.sentence(word_count: 4)
  rep_count = Faker::Number.digit
  duration = Time.zone.now

  Training.create({ title: title, description: description, rep_count: rep_count, duration: duration })
end

puts '### TRAINING PROGRAMS ### '
puts 'Creating training programs...'

trainings = Training.first(6)
training_second = Training.last(6)
2.times do |n|
  title = "Training Program #{Faker::Number.digit}"
  description = Faker::Lorem.sentence(word_count: 5)

  training_program = TrainingProgram.create({ title: title, description: description, user: users[n] })

  training_program.trainings = if n <= 3
                                 trainings
                               else
                                 training_second
                               end
end

puts '### USER RELATIONS ### '
puts 'Creating user relations...'
users = User.all
user = users.first

following = users[2..25]
followers = users[3..15]

following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts '### SEED FINISHED ###'
