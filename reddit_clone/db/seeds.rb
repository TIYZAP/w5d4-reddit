# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



  @users = []

  10.times do

  @users << User.create!(
  username: Faker::StarWars.character + "#{rand(1..1000)}",
  email_address: Faker::Internet.email,
  password: "admin"
  )
  end

  @links = []

  10.times do

  @links << Link.create(
  title: Faker::Hacker.say_something_smart,
  user: @users.sample,
  url: Faker::Internet.url,
  votes: rand(1..100)
  )
  end


  @tags = []

  10.times do

  @tags << Tag.create!(
    name: Faker::Hacker.noun
  )
  end

  100.times do

    Tagging.create!(
    link: @links.sample,
    tag: @tags.sample
    )
  end
