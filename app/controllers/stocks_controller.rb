class StocksController < ApplicationController
  require 'iex-ruby-client'
  def index
    # client = IEX::Api::Client.new(
    #   publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
    #   secret_token: 'Tsk_c3bab9f09d4440539a75b1803a0f83a4',
    #   endpoint: 'https://sandbox.iexapis.com/stable'
    # )
    # @all = client.crypto('BTCUSD')
    # @fb = client.price('FB')
    # @apple = client.price('AAPL')
    # # @chart = client.chart('FB', 'dynamic')
    # @chart = client.chart('MSFT', '1d', chart_simplify: true)
    # # @ohlc = client.ohlc('MSFT')
    # @symbols = client.stock_market_list(:mostactive)
    # @isins = client.get('ref-data/isin', isin: ['US0378331005'], token: 'Tpk_01273dfe6905454eb34261aa36cd7198')
    # @rates = client.fx_latest(%w[USDCAD USDGBP EURUSD GBPUSD USDCHF AUDUSD NZDUSD EURGBP]) # 'USDJPY' MASYADONG MALAKI, #EURGBP, etc. minor currency pair
    
    @stocks = Stock.all
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
      secret_token: 'Tsk_c3bab9f09d4440539a75b1803a0f83a4',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    @data_keys = []
    @data_values = []

    @historical_prices = client.historical_prices('AAPL')
    @historical_prices.each do |price|
      @data_keys << price.label
      @data_values << price.close
    end
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

    historical_prices = client.historical_prices(@stock.symbol)
    @price = client.price(@stock.symbol)

    historical_prices.each do |price|
      @data_keys << price.label
      @data_values << price.close
    end
  end
end
