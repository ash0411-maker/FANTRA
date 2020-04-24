FactoryBot.define do
  factory :tour do
    guide_id { Faker::Number.number(digits:2) }
    city_id { Faker::Number.number(digits:2) }
    genre_id { Faker::Number.number(digits:2) }
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:100) }
    contents_of_price { Faker::Lorem.characters(number:50) }
    capacity { Faker::Number.number(digits:2) }
    time { Faker::Lorem.characters(number:5) }
    price { Faker::Number.number(digits:10) }
    is_active { Faker::Boolean.boolean }
    meetingpoint_address { Faker::Lorem.characters(number:5) }
    meetingpoint_introduction { Faker::Lorem.characters(number:5) }
  end
end








# t.integer "genre_id", null: false
#     t.integer "guide_id", null: false
#     t.integer "city_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.boolean "is_active", default: true
#     t.string "time"
#     t.string "meetingpoint_address"
#     t.string "meetingpoint_introduction"
#     t.float "latitude"
#     t.float "longitude"