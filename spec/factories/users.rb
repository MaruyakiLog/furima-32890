FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { 'テスト_ミョウジ' }
    first_name_kana       { 'テスト_ナマエ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
