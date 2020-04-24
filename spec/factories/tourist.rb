FactoryBot.define do
  factory :tourist do
    email { Faker::Internet.email }
    name { Faker::Lorem.characters(number:10) }
    family_name { Faker::Lorem.characters(number:10) }
    nationality { Faker::Lorem.characters(number:5) }
    postal_code { Faker::Lorem.characters(number:7) }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber }
    sex { Faker::Lorem.characters(number:1) }
    birth_year { Faker::Number.number(digits:4) }
    is_active { Faker::Boolean.boolean }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
