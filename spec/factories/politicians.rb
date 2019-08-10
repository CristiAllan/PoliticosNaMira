FactoryBot.define do
  factory :politician do
    name { Faker::Name.name }
    political_party { Faker::Lorem.characters(number: 4) }
    age { Faker::Number.decimal_part(digits: 2) }
    type { Faker::Lorem.word }
    state { Faker::Lorem.characters(number: 2) }
    image_url { Faker::Lorem.sentence }
  end
end