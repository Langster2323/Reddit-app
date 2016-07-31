# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  link_title = [
    Faker::Company.catch_phrase,
    ["OG of", "ready to", "flew by", "discovered by"].sample,
    Faker::Hipster.word,
  ].join(" ")
  link = Link.create(title: link_title,
          url: Faker::Hacker.adjective+Faker::Hacker.noun+".com")
          Vote.create(link_id: link.id)
end
