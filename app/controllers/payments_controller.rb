class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = Payment.all
    # @filtered_names = sorted_company_name(@payments)
  end

  def show
    @payment = Payment.find_by(params[:id])
  end

  def buy
    @payment = Payment.new
  end

  def sell
    @payment = Payment.new
  end

  def create
    client = CallApi.call
    stocks = Stock.all
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.wallet_id = current_user.id # value needs to be replaced with dynamic user_id
    @payment.time_placed = Time.now
    @payment.current_price = client.price(stocks[@payment.stock_id].symbol)
    
    if @payment.save
      redirect_to stocks_path
    else
      puts params
      redirect_back fallback_location: payments_path
    end
  end


  private

  def payment_params
    params.require(:payment).permit(:quantity, :stock_id, :transaction_type)
  end
end
