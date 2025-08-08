FactoryBot.define do
  factory :event do
    title { Faker::Music::RockBand.name + " Live" }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.city }
    start_time { 2.days.from_now }
    end_time { 3.days.from_now }
    capacity { rand(50..200) }
    price { Faker::Commerce.price(range: 10.0..200.0) }
  end
end
