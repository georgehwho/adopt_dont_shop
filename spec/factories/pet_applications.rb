FactoryBot.define do
  factory :random_pet_application, class: PetApplication do
    association :pet, factory: :random_pet
    association :application, factory: :random_application
  end
end

