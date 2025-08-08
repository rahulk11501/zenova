FactoryBot.define do
  factory :booking do
    association :user
    association :event
    status { 'confirmed' }
    tickets_count { rand(1..5) }
  end
end
