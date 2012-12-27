FactoryGirl.define do
  factory :article do
    title "beautifull title"
    body "move your body tonight"
    tag_list 'tag'

    factory :invalid_article do
      title nil
      body nil
    end

  end
end
