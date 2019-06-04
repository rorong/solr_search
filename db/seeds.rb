# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Post.create(
    name: "Posts",
    body: "This is the newpost"
  )
end

5.times do
  Post.create(
    name: "Other Posts",
    body: "This is the other one"
  )
end

Post.create(
  name: "Other Posts1",
  body: "This is the other post"
)

Post.create(
  name: "Other Posts2",
  body: "This is the other post"
)

Post.create(
  name: "Other Posts2",
  body: "Thissss is the other post"
)

