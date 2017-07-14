class InvestorController < ApplicationController
  def index
    @calc = CalculateInvestorStats.new
  end

  def show
  end

  def create
    @calc = CalculateInvestorStats.new
    @calc.investment_amount= params[:post][:investment_amount]
    @calc.invest_period= params[:post][:invest_period]
    respond_to do |format|
      format.html { redirect_to investor_show_path(real_profit:  @calc.real_profit,
                                                   target_profit: @calc.target_profit,
                                                   investment_amount: @calc.investment_amount,
                                                   invest_period: @calc.invest_period,
                                                   total_real_profit_percent: @calc.total_real_profit_percent),
                    notice: 'Расчет произведен!' }
    end
  end
end
