module StocksHelper
  def change_percentage(symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
      secret_token: 'Tsk_c3bab9f09d4440539a75b1803a0f83a4',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
  
    historical_price = client.historical_prices(symbol)
    historical_price[0]
  end

  def get_logo(symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
      secret_token: 'Tsk_c3bab9f09d4440539a75b1803a0f83a4',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    logo_url = client.logo(symbol)
    return logo_url.url 
  end

end
