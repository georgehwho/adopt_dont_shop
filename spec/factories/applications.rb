FactoryBot.define do
  factory :random_application, class: Application do
    description { Faker::Food.description }
    status { ["In Progress", "Pending", "Accepted", "Rejected"].shuffle }

    association :pet, factory: :random_pet
    association :applicant, factory: :random_applicant
  end
end

