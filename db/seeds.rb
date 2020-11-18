require 'faker'
require 'open-uri'

puts "Cleaning up the DB"
  Item.destroy_all
  Message.destroy_all
  Chatroom.destroy_all
  User.destroy_all
puts "          ... done!"

puts "Creating Users"
  file = URI.open("https://avatars3.githubusercontent.com/u/11991244?v=4")
  User.create!( email: 'olivier@dotreppe.be',
                password: '123456',
                password_confirmation: '123456',
                first_name: 'Olivier',
                last_name: "d'Otreppe",
                generic_message: "I would be so happy to get my stuff back. Please contact me!"
                ).avatar.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

  file = URI.open("https://avatars2.githubusercontent.com/u/71709801?v=4")
  User.create!( email: 'ScottvanStrydonck@gmail.com',
                password: '123456',
                password_confirmation: '123456',
                first_name: 'Scott',
                last_name: "Van Strydonck"
                ).avatar.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

  file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601370359/fhlao5go9y2ak4uqxzb6.jpg")
  User.create!( email: 'Lex.Radj@gmail.com',
                password: '123456',
                password_confirmation: '123456',
                first_name: 'Lex',
                last_name: "Radj",
                generic_message: "I would be so happy to get my stuff back. Please contact me!"
                ).avatar.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

  file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1603807623/rkkm2rsclqznydbt7rxb.jpg")
  User.create!( email: 'thibault.a@hotmail.com',
                password: '123456',
                password_confirmation: '123456',
                first_name: 'Thibault',
                last_name: "Alexandre",
                generic_message: "I would be so happy to get my stuff back. Please contact me!"
                ).avatar.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

  file = URI.open("https://avatars3.githubusercontent.com/u/71701904?v=4")
  User.create!( email: 'Charles.delalaing@gmail.com',
                password: '123456',
                password_confirmation: '123456',
                first_name: 'Charles',
                last_name: "de Lalaing"
                ).avatar.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')
puts "          ... done!"

puts "Creating some random objects"
  notification = ["true", "false"]
  30.times { Item.create!(name: Faker::Beer.brand, user_id: User.ids.sample, message: Faker::Hacker.say_something_smart, notification: notification.sample) }
puts "          ... done!"
