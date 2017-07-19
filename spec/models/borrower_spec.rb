require 'rails_helper'

describe 'Borrower', type: :model do
  it 'is a valid factory' do
    expect(build(:borrower)).to be_valid
  end
  
  it 'is valid with name, loan, period, annual_rate, overdue_rate' do
    borrower = Borrower.new(id: 1,
                            name: 'sample name',
                            loan: 1_000_000,
                            period: 6,
                            annual_rate: 30,
                            overdue_rate: 50,
                            )
    expect(borrower).to be_valid
  end

  it 'is invalid without name' do
    borrower = build(:borrower, name: nil)
    borrower.valid?
    expect(borrower.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without loan' do
    borrower = build(:borrower, loan: nil)
    borrower.valid?
    expect(borrower.errors[:loan]).to include("can't be blank")
  end

  it 'is invalid without period' do
    borrower = build(:borrower, period: nil)
    borrower.valid?
    expect(borrower.errors[:period]).to include("can't be blank")
  end

  it 'is invalid without annual_rate' do
    borrower = build(:borrower, annual_rate: nil)
    borrower.valid?
    expect(borrower.errors[:annual_rate]).to include("can't be blank")
  end

  it 'is invalid without overdue_rate' do
    borrower = build(:borrower, overdue_rate: nil)
    borrower.valid?
    expect(borrower.errors[:overdue_rate]).to include("can't be blank")
  end
end
