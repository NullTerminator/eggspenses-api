FactoryGirl.define do
  factory :production do
    count { rand(15..27) }
    date { rand(14).days.ago.to_date }

    product_id nil
  end
end
