FactoryBot.define do
  factory :random_shelter, class: Shelter do
    name { Faker::Company.name }
    city { Faker::Address.city }
    foster_program { [true, false].sample }
    rank { rand(1..10) }
  end
end