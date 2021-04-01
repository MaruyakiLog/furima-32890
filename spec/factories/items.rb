FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/gorilla002.jpg'), filename: 'gorilla002.jpg')
    end
    name              { Faker::Name.name }
    description       { Faker::Lorem.sentence }
    category_id       { Faker::Number.within(range: 2..11) }
    condition_id      { Faker::Number.within(range: 2..7) }
    responsibility_id { Faker::Number.within(range: 2..3) }
    prefecture_id     { Faker::Number.within(range: 2..48) }
    day_id            { Faker::Number.within(range: 2..4) }
    price             { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
