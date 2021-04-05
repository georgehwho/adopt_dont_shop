FactoryBot.define do
  factory :random_application, class: Application do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip }
    description { Faker::Food.description }
    status { ["In Progress", "Pending", "Accepted", "Rejected"].sample }
  end
end