class HomeController < ApplicationController
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
    # @all_symbols = client.ref_data_symbols

    # @company_info = client.company(@all_symbols[911].symbol)

    # @isins = client.get('ref-data/isin', isin: ['US0378331005'], token: 'Tpk_01273dfe6905454eb34261aa36cd7198')
    # @rates = client.fx_latest(%w[USDCAD USDGBP EURUSD GBPUSD USDCHF AUDUSD NZDUSD EURGBP]) # 'USDJPY' MASYADONG MALAKI, #EURGBP, etc. minor currency pair
  end
end
