FactoryBot.define do
  factory :purchase_shipping do
    postal_number   { '123-4567' }
    prefecture_id   { Faker::Number.within(range: 2..48) }
    city            { Faker::Lorem.sentence }
    address         { Faker::Lorem.sentence }
    building        { Faker::Lorem.sentence }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
    token           { 'tok_abcdefghijk00000000000000000' }
    user_id         { Faker::Number.number(digits: 1)}
    item_id         { Faker::Number.number(digits: 1)}
  end
end
