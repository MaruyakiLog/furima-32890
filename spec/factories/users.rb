FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    # password = Faker::Internet.password( min_length: 6, mix_case: true)
    password = "#{1}a" + Faker::Internet.password(min_length: 4)
    password              { password }
    password_confirmation { password }
    last_name             { '名字' }
    first_name            { '名前' }
    last_name_kana        { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
