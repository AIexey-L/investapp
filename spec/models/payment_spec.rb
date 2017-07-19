require 'rails_helper'

RSpec.describe Payment, type: :model do
  
  it 'has valid factories' do
    payment = build(:payment)
    expect(build(:payment)).to be_valid
  end

  it 'is valid with month, borrower_id, payment and existing borrower using factory' do
    payment = build(:payment)
    expect(payment).to be_valid
  end 

  it 'is valid with month, borrower_id, payment and existing borrower' do
    payment = Payment.new(id: 1,
                          borrower_id: 77,
                          month: 3,
                          payment: 1000
                          )
    borrower = Borrower.create(id: 77,
                               name: 'sample name',
                               loan: 1_000_000,
                               period: 6,
                               annual_rate: 30,
                               overdue_rate: 50,
                               )
    expect(payment).to be_valid
  end

  it 'is invalid without month' do
    payment = build(:payment, month: nil)
    payment.valid?
    expect(payment.errors[:month]).to include("can't be blank")
  end

  it 'is invalid without borrower_id' do
    payment = build(:payment, borrower_id: nil)
    payment.valid?
    expect(payment.errors[:borrower_id]).to include("can't be blank")
  end

  it 'is invalid without payment' do
    payment = build(:payment, payment: nil)
    payment.valid?
    expect(payment.errors[:payment]).to include("can't be blank")
  end

  it 'does not allow to duplicate same month payment for one borrower' do
    borrower = Borrower.create(id: 77,
                               name: 'sample name',
                               loan: 1_000_000,
                               period: 6,
                               annual_rate: 30,
                               overdue_rate: 50
                               )
    borrower.payments.create(month: 5, payment: 100)
    new_payment = borrower.payments.new(month: 5, payment: 200 )
    new_payment.valid?
    expect(new_payment.errors[:month]).to include('has already been taken')
  end

  it 'does not allow to duplicate same month payment for one borrower using factories' do
    payment1 = create(:payment, month: 5)
    payment2 = build(:payment, month: 5, borrower_id: payment1.borrower.id)
    payment2.valid?
    expect(payment2.errors[:month]).to include('has already been taken')
  end

  it 'allow to have payments with same months number for different borrowers' do
    borrower1 = Borrower.create(id: 77,
                               name: 'sample name',
                               loan: 1_000_000,
                               period: 6,
                               annual_rate: 30,
                               overdue_rate: 50
                               )
    borrower2 = Borrower.create(id: 99,
                               name: 'sample name',
                               loan: 2_000_000,
                               period: 7,
                               annual_rate: 30,
                               overdue_rate: 50
                               )
    borrower1.payments.create(month: 5, payment: 100)
    other_payment = borrower2.payments.create(month: 5, payment: 100)
    expect(other_payment).to be_valid
  end

  it 'allow to have payments with same months number for different borrowers' do
    payment1 = create(:payment, month: 6)
    payment2 = build(:payment, month: 6)
    puts "#{payment1.inspect}"
    puts "#{payment2.inspect}"
    expect(payment2).to be_valid
  end
end
