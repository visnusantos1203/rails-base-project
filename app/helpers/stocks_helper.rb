module StocksHelper
  def change_percentage(symbol)
    client = CallApi.call
  
    historical_price = client.historical_prices(symbol)
    historical_price[0]
  end

  def get_logo(symbol)
    client = CallApi.call
    logo_url = client.logo(symbol)
    return logo_url.url 
  end

  def get_chart_data(stock)
    client = CallApi.call
    @data_keys = []
    @data_values = []

    historical_prices = client.historical_prices(stock.symbol)

    historical_prices.each do |price|
      @data_keys << price.label
      @data_values << price.close
    end

    return { data_keys: @data_keys, data_values: @data_values }
   
  end

end
