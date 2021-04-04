FactoryBot.define do
  factory :application do
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { "MyString" }
    description { "MyText" }
    status { "MyString" }
    pet { nil }
  end
end
