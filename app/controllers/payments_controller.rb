class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = Payment.all
    # @filtered_names = sorted_company_name(@payments)
    respond_to do |format|
      format.html
      format.csv { send_data @payments.to_csv }
    end
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

  def new_cashin
    @payment = Payment.new
  end

  def cashin
    @session = StripeCashIn.perform(params[:amount], params[:currency])
    # !! needs to have fallback option when the stripe checkout fails !! 
    @payment = Payment.create({
      transaction_type: "cash-in",
      user_id: current_user.id,
      wallet_id: current_user.id,
      time_placed: Time.now,
      quantity: 1,
      current_price: params[:amount]
    })
    PaymentHandler.top_up(params[:amount].to_i, current_user.id)

    respond_to do |format|
      format.js
    end
    
    
    

  end

  def create
    client = CallApi.call
    stocks = Stock.all
    user_id = current_user.id
    @payment = Payment.new(payment_params)
    current_price = client.price(stocks[@payment.stock_id].symbol)
    amount = (payment_params[:quantity].to_i * current_price)

    if BalanceChecker.enough_balance(amount, user_id) == true
      @payment.current_price = current_price

      if @payment.save
        PaymentHandler.deduct_payment(amount, user_id)

        redirect_to portfolios_path
      else
        puts "Your transaction did not push through"
        redirect_back fallback_location: payments_path
      end
    else
      redirect_back fallback_location: stocks_path
      puts "Insufficient balance"
    end

  end

  private

  def payment_params
    params.require(:payment).permit(:quantity, :stock_id, :transaction_type, :user_id, :wallet_id, :time_placed)
  end
end
