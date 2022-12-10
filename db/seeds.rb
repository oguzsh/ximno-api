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
admin_user = User.create!({ email: 'admin@gmail.com', first_name: 'Admin', last_name: 'Root', password: '12345678',
                            password_confirmation: '12345678' })

puts 'Creating normal user...'
normal_user = User.create!({ email: 'ozi@gmail.com', first_name: 'Ozi', last_name: 'Ince', password: '12345678',
                             password_confirmation: '12345678' })

puts '### POSTS ### '
puts 'Creating posts...'

post1 = Post.create({ user: normal_user, body: 'This is post for normal user', archived: false })
post2 = Post.create({ user: admin_user, body: 'This is post for admin user', archived: false })

puts '### COMMENTS ### '
puts 'Creating comments...'
Comment.create({ user: normal_user, post: post1, body: 'This is comment for normal post' })
Comment.create({ user: admin_user, post: post2, body: 'This is comment for admin post' })

puts '### TRAININGS ### '
puts 'Creating trainings...'
training1 = Training.create({ title: 'Training 1', description: 'This is training 1', rep_count: 5,
                              duration: Time.zone.now })
training2 = Training.create({ title: 'Training 2', description: 'This is training 2', rep_count: 15,
                              duration: Time.zone.now })
training3 = Training.create({ title: 'Training 3', description: 'This is training 3', rep_count: 12,
                              duration: Time.zone.now })

puts '### TRAINING PROGRAMS ### '
puts 'Creating training programs...'
training_program1 = TrainingProgram.create({ title: 'Training Program 1',
                                             description: 'This is training program 1 description ', user: normal_user })
training_program1.trainings << training1
training_program1.trainings << training2

training_program2 = TrainingProgram.create({ title: 'Training Program 2',
                                             description: 'This is training program 2 description', user: admin_user })
training_program2.trainings << training2
training_program2.trainings << training3

training_program3 = TrainingProgram.create({ title: 'Training Program 3',
                                             description: 'This is training program 3description', user: normal_user })
training_program3.trainings << training1
training_program3.trainings << training3

puts '### SEED FINISHED ###'
