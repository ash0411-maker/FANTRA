FactoryBot.define do
  factory :chat_notice do
    checked { Faker::Boolean.boolean }
  end
end
