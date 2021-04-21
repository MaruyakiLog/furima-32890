FactoryBot.define do
  factory :shipping do
    association :purchase
  end
end
