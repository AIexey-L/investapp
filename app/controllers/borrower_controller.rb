class BorrowerController < ApplicationController
  before_action :set_borrower, only: [:show, :edit, :update, :destroy]

  def index
    @borrowers = Borrower.all
  end

  def show    
  end

  def new
    @borrower = Borrower.new
  end

  def edit
  end

 def create
    @borrower = Borrower.new(borrower_params)

    respond_to do |format|
      if @borrower.save
        format.html { redirect_to @borrower, notice: 'Заемщик успешно создан' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @borrower.update(borrower_params)
        format.html { redirect_to @borrower, notice: 'Заемщик успешно изменен' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @borrower.destroy
    respond_to do |format|
      format.html { redirect_to borrowers_url, notice: 'Заемщик успешно удален' }
    end
  end

  private
    def set_borrower
      @borrower = Borrower.find(params[:id])
    end

    def borrower_params
      params.require(:borrower).permit(:title)
    end

end
