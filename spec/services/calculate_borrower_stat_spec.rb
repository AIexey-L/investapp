require 'rails_helper'

describe 'CalculateBorrowerStats#call' do
  it 'calculate stats, which are related to borrower\'s payments' do
    borrower = Borrower.new(id: 1,
                            name: 'sample name',
                            loan: 1_000_000,
                            period: 6,
                            annual_rate: 30,
                            overdue_rate: 50
                            )
    borrower.save

    payment1 = Payment.new(id: 1,
                           borrower_id: 1,
                           month: 1,
                           payment: 191_666.67)
    payment1.save
    
    payment2 = Payment.new(id: 2,
                           borrower_id: 1,
                           month: 2,
                           payment: 191_666.67)
    payment2.save

    payment3 = Payment.new(id: 3,
                           borrower_id: 1,
                           month: 3,
                           payment: 191_666.67)
    payment3.save

    payment4 = Payment.new(id: 4,
                           borrower_id: 1,
                           month: 4,
                           payment: 191_666.67)
    payment4.save

    payment5 = Payment.new(id: 5,
                           borrower_id: 1,
                           month: 5,
                           payment: 191_666.67)
    payment5.save

    payment6 = Payment.new(id: 6,
                           borrower_id: 1,
                           month: 6,
                           payment: 191_666.67)
    payment6.save

    calc_object = CalculateBorrowerStats.new
    result = calc_object.call(borrower.id)
    expect(result).to eq(monthly_debt_payment: 166_666.67,
                         monthly_percent_payment: 25_000.0,
                         monthly_total_payment: 191_666.67,
                         total_payment: 1_150_000.02,
                         debt_payed: 1_000_000.0,
                         percent_paid: 150_000.02,
                         profit_percent: 30.0)
    
  end
end
