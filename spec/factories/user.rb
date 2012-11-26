FactoryGirl.define do
  factory :user do
    email "johnDoe@mindoverflow.com"
    nickname "john"
    role "author"
    password "secret"
    password_confirmation "secret"
    approved true

    factory :admin do
      email "admin@mindoverflow.com"
      role "admin"
    end

    factory :notapproved do
      approved false
    end
  end
end
