# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Chatroom.create(name: "general")
puts "Creating Users"
  User.create!(:email => 'olivier@dotreppe.be', :password => '123456', :password_confirmation => '123456', :first_name => 'Olivier', :last_name => "d'Otreppe", :username => 'odotreppe')
  User.create!(:email => 'ScottvanStrydonck@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Scott', :last_name => "Van Strydonck", :username => 'svanstrydonck')
  User.create!(:email => 'Lex.Radj@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Lex', :last_name => "Rajd", :username => 'lradj')
  User.create!(:email => 'Thibault.alexandre@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Thibault', :last_name => "Alexandre", :username => 'talexandre')
  User.create!(:email => 'Charles.delalaing@gmail.com', :password => '123456', :password_confirmation => '123456', :first_name => 'Charles', :last_name => "de Lalaing", :username => 'cdelalaing')
puts "end of creating Users"
