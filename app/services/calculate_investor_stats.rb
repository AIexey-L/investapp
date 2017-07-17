class CalculateInvestorStats
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  attr_reader :investment_amount, :invest_period

  def investment_amount=(from_attr)
    @investment_amount = from_attr.to_f
  end

  def invest_period=(from_attr)
    @invest_period = from_attr.to_i
  end
  
  def persisted?
    true
  end

  def total_real_profit_percent
    calc = CalculateBorrowerStats.new
    borrower_ids = Borrower.pluck(:id)
    borrower_ids.each do |id|
      @sum_profit ||= 0
      @sum_debt ||= 0
      @sum_profit += calc.call(id)[:percent_paid]
      @sum_debt += calc.call(id)[:debt_payed]
    end
    (@sum_profit / @sum_debt / 6 * 12 * 100).round(2)
  end

  def real_profit
    (@investment_amount * total_real_profit_percent / 100 / 12 * @invest_period).round(2)
  end

  def target_profit
    (@investment_amount * 30 / 100 / 12 * @invest_period).round(2)
  end
end