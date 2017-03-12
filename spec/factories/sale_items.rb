FactoryGirl.define do
  sequence :sale_item_name do |n|
    "sale-item-name-#{n}"
  end

  factory :sale_item do
    name { FactoryGirl.generate :sale_item_name }
    price { rand 2.5..13.75 }
    product_count { rand 3..13 }

    product_id nil
  end
end
