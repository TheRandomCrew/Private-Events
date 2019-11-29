# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

users = User.create([
    {name: 'Aheebwa Ramadhan', email: 'mail@raheebwa.com', password: 'password', password_confirmation: 'password'},
    {name: 'Israel Laguan', email: 'israel@email.com', password: 'password', password_confirmation: 'password'},
])

users.each do |user|
    10.times do
        @event = user.events.build(location: Faker::Nation.capital_city,
             date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
                description: "#{Faker::Company.bs}: \n#{Faker::Lorem.paragraph}")
        @event.save 
        user.user_events.build(event_id: @event.id).save
    end

end
