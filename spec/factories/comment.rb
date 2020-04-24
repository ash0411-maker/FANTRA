FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number:200) }
  end
end
