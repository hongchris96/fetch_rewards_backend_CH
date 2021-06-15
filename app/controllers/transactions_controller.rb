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
      # debugger
      delta_points = params[:transaction][:points].to_i
      if (delta_points < 0 && @payer.balance > -delta_points) || delta_points >= 0
        @payer.update(balance: @payer.balance + delta_points)
        @transaction = Transaction.new(payer_id: @payer.id, points: delta_points, remaining_balance: @payer.balance)
        if @transaction.save
          redirect_to transactions_url
        else
          flash.now[:errors] = @transaction.errors.full_messages
          render :new
        end
      else
        flash.now[:errors] = "User balance cannot be below zero"
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
