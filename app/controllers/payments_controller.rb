class PaymentsController < ApplicationController
  before_action :set_payment, only: [:edit, :update, :destroy]
  before_action :set_borrower, only: [:index, :new, :create]

  def index
    @payments = Payment.where(borrower_id: params[:borrower_id])
  end

  def new
    @payment = Payment.new(borrower_id: params[:borrower_id])
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.borrower_id = params[:borrower_id]
    respond_to do |format|
      if @payment.save
        format.html { redirect_to borrower_payments_path, notice: 'Платеж успешно создан' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to borrower_payments_url, notice: 'Платеж успешно изменен' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to borrower_payments_url, notice: 'Платеж успешно удален' }
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def set_borrower
    @borrower = Borrower.find(params[:borrower_id])
  end

  def payment_params
    params.require(:payment).permit(:id, :borrower_id, :month, :payment)
  end
end
