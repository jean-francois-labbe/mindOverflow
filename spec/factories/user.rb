FactoryGirl.define do
  factory :user do
    email "johnDoe@mindoverflow.com"
    nickname "john"
    role "author"
    password "secret"
    password_confirmation "secret"
  end
end
