FactoryBot.define do
  factory :message do
    from { { name: "MyString", email: 'bla@bla.com' } }
    body { 'MyString' }
  end
end
