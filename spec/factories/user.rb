FactoryGirl.define do
  factory :user do
    email "johnDoe@test.com"
    nickname "john"
    role = "author"
  end
end
