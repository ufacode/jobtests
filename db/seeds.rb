require 'faker'

100.times do
  Post.create(
          title: Faker::Lorem.sentence(5),
          description: Faker::Lorem.sentence(100)
  )
end
