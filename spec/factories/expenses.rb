FactoryGirl.define do
  sequence :expense_name do |n|
    "expense-name-#{n}"
  end

  factory :expense do
    name { FactoryGirl.generate :expense_name }
    price { rand(1.25..25.3) }
    period nil

    expensable_type nil
    expensable_id nil
  end
end
