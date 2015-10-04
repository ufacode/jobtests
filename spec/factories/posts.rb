FactoryGirl.define do
  factory :post do
    title       { Faker::Lorem.sentence(5) }
    description { Faker::Lorem.sentence(100) }
  end
end
