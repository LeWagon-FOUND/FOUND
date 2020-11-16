# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "Cleaning up the DB"
  Item.destroy_all
  Message.destroy_all
  Profile.destroy_all
  Chatroom.destroy_all
  User.destroy_all
puts "          ... done!"

puts "Creating Users"
  file = URI.open("https://avatars3.githubusercontent.com/u/11991244?v=4")
  User.create!(email: 'olivier@dotreppe.be', password: '123456', password_confirmation: '123456')
  Profile.create!(first_name: 'Olivier', last_name: "d'Otreppe", user_id: User.last.id).avatar.attach(io: file, filename: 'cover.png', content_type: 'image/png')

  file = URI.open("https://avatars2.githubusercontent.com/u/71709801?v=4")
  User.create!(email: 'ScottvanStrydonck@gmail.com', password: '123456', password_confirmation: '123456')
  Profile.create!(first_name: 'Scott', last_name: "Van Strydonck", user_id: User.last.id).avatar.attach(io: file, filename: 'cover.png', content_type: 'image/png')

  file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601370359/fhlao5go9y2ak4uqxzb6.jpg")
  User.create!(email: 'Lex.Radj@gmail.com', password: '123456', password_confirmation: '123456')
  Profile.create!(first_name: 'Lex', last_name: "Rajd", user_id: User.last.id).avatar.attach(io: file, filename: 'cover.png', content_type: 'image/png')

  file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1603807623/rkkm2rsclqznydbt7rxb.jpg")
  User.create!(email: 'Thibault.alexandre@gmail.com', password: '123456', password_confirmation: '123456')
  Profile.create!(first_name: 'Thibault', last_name: "Alexandre", user_id: User.last.id).avatar.attach(io: file, filename: 'cover.png', content_type: 'image/png')

  file = URI.open("https://avatars3.githubusercontent.com/u/71701904?v=4")
  User.create!(email: 'Charles.delalaing@gmail.com', password: '123456', password_confirmation: '123456')
  Profile.create!(first_name: 'Charles', last_name: "de Lalaing", user_id: User.last.id).avatar.attach(io: file, filename: 'cover.png', content_type: 'image/png')

  users = []
  User.all.each { |user| users << user.id }
puts "          ... done!"

puts "Creating two chatrooms"
  Chatroom.create!(name: "general", user_id: users.sample, finder_user_id: users.sample)
  Chatroom.create!(name: "not general", user_id: users.sample, finder_user_id: users.sample)

  chatrooms = []
  Chatroom.all.each { |chatroom| chatrooms << chatroom.id }
puts "          ... done!"

puts "Creating some random messages"
  10.times { Message.create!(content: Faker::Quote.yoda, user_id: users.sample, chatroom_id: chatrooms.sample) }
puts "          ... done!"

puts "Creating some random objects"
  20.times { Item.create!(name: Faker::Beer.brand, user_id: users.sample, message: Faker::Hacker.say_something_smart, notification: false) }
puts "          ... done!"
