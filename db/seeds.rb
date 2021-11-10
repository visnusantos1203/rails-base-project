# Populate Stock model with company details
Stock.destroy_all

client = CallApi.call

all_symbols = client.ref_data_symbols

500.times do |index|
  company_info = client.company(all_symbols[index].symbol)
  historical_prices = client.historical_prices(all_symbols[index].symbol)

  begin
    new_stock = Stock.new(symbol: all_symbols[index].symbol, 
                          company_name: company_info.company_name,
                          description: company_info.description,
                          logo_url: "https://storage.googleapis.com/iex/api/logos/#{all_symbols[index].symbol}.png")
    price_history = new_stock.price_history
    historical_prices.each do |price|
      price_history.push(price.close)
    end
    new_stock.save
  rescue  StandardError
    nil
  end
end