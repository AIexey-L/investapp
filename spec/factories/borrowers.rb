FactoryGirl.define do
  factory :borrower do
    id 1
    name 'sample name'
    loan 1_000_000
    period 6
    annual_rate 30
    overdue_rate 50
  end
end
