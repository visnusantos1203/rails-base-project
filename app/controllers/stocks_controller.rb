class StocksController < ApplicationController
  require 'iex-ruby-client'
  def index
    @stocks = Stock.all.order("id ASC")
  end

  def show
   @stock = Stock.find(params[:id])
   
   client = IEX::Api::Client.new(
      publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
      secret_token: 'Tsk_c3bab9f09d4440539a75b1803a0f83a4',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    @data_keys = []
    @data_values = []
    @price = client.price(@stock.symbol)

    historical_prices = client.historical_prices(@stock.symbol)

    historical_prices.each do |price|
      @data_keys << price.label
      @data_values << price.close
    end

    @news = client.news(@stock.symbol)
  end
end
