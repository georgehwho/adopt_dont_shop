FactoryBot.define do
  factory :random_pet, class: Pet do
    name { Faker::Creature::Dog.name }
    breed { Faker::Creature::Dog.breed }
    age { rand(1..15) }
    adoptable { [true, false].sample }

    association :shelter, factory: :random_shelter
  end
end