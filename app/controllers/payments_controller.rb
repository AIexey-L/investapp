class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = Payment.all
  end

  def show    
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

 def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Платеж успешно создан' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @paynemt.update(payment_params)
        format.html { redirect_to @payment, notice: 'Платеж успешно изменен' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Заемщик успешно удален' }
    end
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:month, :payment)
    end

end
