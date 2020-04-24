FactoryBot.define do
  factory :chat_notice do
    name { Faker::Lorem.characters(number:10) }
  end
end
