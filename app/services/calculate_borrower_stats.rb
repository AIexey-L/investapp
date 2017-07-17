class CalculateBorrowerStats
  attr_reader :result
  
  def call(id)
    @borrower = Borrower.find(id)
    @payments = Payment.where(borrower_id: id)
    @payments_sum = @payments.sum(:payment)
    @result = { monthly_debt_payment: monthly_debt_payment,
                monthly_percent_payment: monthly_percent_payment,
                monthly_total_payment: monthly_total_payment,
                total_payment: total_payment,
                percent_paid: percent_paid,
                debt_payed: debt_payed,
                profit_percent: profit_percent }
  end

  private

  def monthly_debt_payment
    (@borrower.loan / @borrower.period).round(2)
  end

  def monthly_percent_payment
    ((@borrower.loan * @borrower.annual_rate / 100) / 12).round(2)
  end

  def monthly_total_payment
    (monthly_debt_payment + monthly_percent_payment).round(2)
  end

  def total_payment
    (monthly_total_payment * @borrower.period).round(2)
  end

  def percent_paid
    (@payments_sum - @borrower.loan).round(2)
  end

  def debt_payed
    @borrower.loan.round(2)
  end

  def profit_percent
    (percent_paid / debt_payed * 12 / @borrower.period).round(2) * 100
  end
end
