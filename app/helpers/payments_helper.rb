module PaymentsHelper
  def calculate_quantity
    @quantity = @payment.amount / @price
  end
  
  def get_price(index)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_01273dfe6905454eb34261aa36cd7198',
      secret_token: 'secret_token',
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    stocks = Stock.all
    @price = client.price(stocks[index].symbol)
  end
end
