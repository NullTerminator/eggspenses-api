FactoryGirl.define do
  sequence :product_name do |n|
    "product-name-#{n}"
  end

  factory :product do
    name { FactoryGirl.generate :product_name }

    asset_id nil
  end
end
