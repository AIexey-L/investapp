FactoryGirl.define do
  factory :payment do
    sequence(:month) { |n| n }
    payment 1_000
    association :borrower
  end
end
