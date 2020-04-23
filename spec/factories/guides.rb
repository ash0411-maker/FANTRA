FactoryBot.define do
  factory :guide do
    email { Faker::Internet.email }
    name { Faker::Lorem.characters(number:10) }
    family_name { Faker::Lorem.characters(number:10) }
    nationality { Faker::Lorem.characters(number:5) }
    postal_code { Faker::Lorem.characters(number:7) }
    address { Faker::Lorem.characters(number:13) }
    phone_number { Faker::Lorem.characters(number:10) }
    selfy_image_id { Faker::Lorem.characters(number:50) }
    identification_image_id { Faker::Lorem.characters(number:50) }
    introduction { Faker::Lorem.characters(number:100) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end










