class Borrower < ApplicationRecord
  validates :name, :loan, :period, :annual_rate, :overdue_rate, presence: true
  has_many :payments

  def monthly_debt_payment(borrower)
    borrower.loan/borrower.period
  end

  def monthly_percent_payment(borrower)
    (borrower.loan*borrower.annual_rate/100)/12
  end

  def monthly_total_payment(borrower)
    monthly_debt_payment(borrower)+monthly_percent_payment(borrower)
  end

  def total_payment(borrower)
    monthly_total_payment(borrower)*borrower.period
  end

end