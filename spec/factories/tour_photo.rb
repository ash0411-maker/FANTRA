FactoryBot.define do

  factory :tour_photo do
    image_id { Faker::Lorem.characters(number:50) }
  end

end
