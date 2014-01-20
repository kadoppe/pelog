FactoryGirl.define do
  factory :article do
    body 'Article Body'
    sequence(:slug) {|n| "slug#{n}" }
    published_at Date::new(2014, 1, 1)
  end
end
