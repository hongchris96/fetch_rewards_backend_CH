class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    render :index
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    render :show
  end
  
  def new
    render :new
  end

  def create
    @payer = User.find_by(username: params[:transaction][:payer_name])
    if @payer
      @transaction = Transaction.new(payer_id: @payer.id, points: params[:transaction][:points])
      if @transaction.save
        redirect_to transactions_url
      else
        flash.now[:errors] = @transaction.errors.full_messages
        render :new
      end
    else
      flash.now[:errors] = "User not in database"
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:payer_name, :points)
  end
end
