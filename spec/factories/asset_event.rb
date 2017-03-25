FactoryGirl.define do
  factory :asset_event do
    count { rand(10..40) }
    date { Date.today }

    asset
  end
end
