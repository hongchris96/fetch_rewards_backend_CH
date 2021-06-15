class SpendsController < ApplicationController
  def create
    spending = params[:spend][:points_req].to_i
    @payer_queue = User.all.order('created_at asc')
    @payer_queue.each do |payer|
      take_from_payer = Transaction.where(payer_id: payer.id).order("remaining_balance asc").limit(1)[0].remaining_balance
      if spending > 0
        if spending >= take_from_payer
          spending -= take_from_payer
        else
          take_from_payer = spending
          spending = 0
        end
        payer.update(balance: payer.balance - take_from_payer)
        @transaction = Transaction.new(payer_id: payer.id, points: -take_from_payer, remaining_balance: payer.balance)
        @transaction.save
      end
    end
    redirect_to transactions_url
  end

  private

  def spend_params
    params.require(:spend).permit(:points_req)
  end
end
