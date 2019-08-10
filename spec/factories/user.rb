FactoryBot.define do
  factory :user do
    email { "m@m.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end
