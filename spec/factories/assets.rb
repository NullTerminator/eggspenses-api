FactoryGirl.define do
  sequence :asset_name do |n|
    "asset-name-#{n}"
  end

  factory :asset do
    name { FactoryGirl.generate :asset_name }
  end
end
