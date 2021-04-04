FactoryBot.define do
  factory :random_applicant, class: Applicant do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip }
  end
end