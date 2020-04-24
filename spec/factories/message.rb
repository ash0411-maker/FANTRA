FactoryBot.define do
  factory :message do
    content { Faker::Lorem.characters(number:200) }
    is_tourist { Faker::Boolean.boolean }
    room_id { Faker::Number.number(digits:1) }
  end
end

