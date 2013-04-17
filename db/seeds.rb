# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


event = Event.create(title: 'BitmakerLabs')
event = Event.create(title: 'MeetupTO')
event = Event.create(title: 'Tech-Network')
event = Event.create(title: 'Code and Coffee')
event = Event.create(title: 'Toronto Ruby Brigade')
event = Event.create(title: 'Toronto Sports and Social Club')
event = Event.create(title: 'Yoga Meetup')
event = Event.create(title: 'Guru Event')

puts "hello, the seed worked"