FactoryBot.define do
  factory :application do
    description { "MyText" }
    status { "MyString" }
    applicants { nil }
    pets { nil }
  end
end
