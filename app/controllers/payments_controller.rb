class PaymentsController < ApplicationController
  before_action :authenticate_user!

  # dito sana naka list lang lahat ng companies na may investment si user
  def index
    @payments = Payment.all
    # @filtered_names = sorted_company_name(@payments)
  end

  # dito pwedeng ma view yung payments sa isang transaction
  def show
    @payment = Payment.find_by(params[:id])
  end

  def new
    @payment = Payment.new
    @stocks = []
    @symbols = []
    stocks = Stock.all
    stocks.each do |stock|
      @stocks.push([stock.company_name, stock.id])
      @symbols << [stock.symbol]
    end
  end
  # i want to dynamically calculate quantity when user indicates the amount he wants to purchase

  def create
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
      secret_token: 'secret_token',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    stocks = Stock.all
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.wallet_id = current_user.id
    @payment.time_placed = Time.now
    @payment.current_price = client.price(stocks[@payment.stock_id].symbol)
    
    @stocks = []
    @symbols = []
    stocks = Stock.all
    stocks.each do |stock|
      @stocks.push([stock.company_name, stock.id])
      @symbols << [stock.symbol]
    end

    if @payment.save
      redirect_to payments_path
    else
      render :new
    end
  end


  private

  def payment_params
    params.require(:payment).permit(:quantity, :stock_id, :transaction_type)
  end
end
