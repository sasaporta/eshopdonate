FactoryGirl.define do
  factory :charity do
    sequence(:name)  { |n| "Sample Charity #{n}" }
    sequence(:url) { |n| "http://sample_charity_#{n}.com" }
    sequence(:amazon_tracking_id) { |n| "esd-sc#{n}-20" }
    sequence(:shortname) { |n| "sc#{n}" }
  end

  factory :merchant do
    sequence(:name)  { |n| "Sample Merchant #{n}" }
    sequence(:link) { |n| "http://sample_merchant_#{n}.com" }
    sequence(:percentage) { |n| n }
    img_url "http://stevesaporta.com/sample_charity_logo.png"
    sequence(:img_alt) { |n| "Sample Merchant #{n}" }
    tracking_img "http://stevesaporta.com/sample_charity_logo.png"
  end

  factory :user do
    email "admin@example.com"
    password "abcd1234"
  end
end
