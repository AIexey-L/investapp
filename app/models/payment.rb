class Payment < ApplicationRecord
  validates :name, :loan, :period, :annual_rate, :overdue_rate, presence: true
  belongs_to :borrower

  def monthly_debt_payment
    @borrower.loan/@borrower.period
  end

  def monthly_percent_payment
    @borrower.loan*@borrower.annual_rate/12
  end

  def monthly_total_payment
    monthly_debt_payment/monthly_percent_payment
  end

  def total_payment
    @borrower.period*monthly_total_payment
  end

end