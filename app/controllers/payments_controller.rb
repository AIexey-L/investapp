class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = Payment.where(borrower_id: params[:borrower_id])
    @borrower = Borrower.find(params[:borrower_id])
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
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Платеж успешно изменен' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Платеж успешно удален' }
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:id, :borrower_id, :month, :payment)
  end

end