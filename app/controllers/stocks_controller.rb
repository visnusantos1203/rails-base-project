class StocksController < ApplicationController
  require 'iex-ruby-client'
  def index
    @stocks = Stock.all.order("id ASC")
  end

  def show
    client = CallApi.call

    @stock = Stock.find(params[:id])
    @price = client.price(@stock.symbol)
    @news = client.news(@stock.symbol)
  end

  # def update_price_history
  #   @stocks = Stock.all.order("id ASC")
  #   # UpdatePriceWorker.perform_async(@stocks)
  #   FetchHistoricalPriceJob.perform_async(@stocks)

  # end
end