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
end