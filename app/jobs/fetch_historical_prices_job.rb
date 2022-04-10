class FetchHistoricalPricesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    stocks = Stock.all.order("id ASC")

    stocks.each do |stock|
      client = CallApi.call

      historical_prices = client.historical_prices(stock.symbol)
      
      updated_price = stock.price_history
      updated_price.shift()
      updated_price.push(historical_prices[historical_prices.length - 1].close)

      stock.update(:price_history, updated_price)
    end
  end
    
end
