module PaymentsHelper
  def calculate_quantity
    @quantity = @payment.amount / @price
  end
  
  def get_price(index)
    client = CallApi.call
    stocks = Stock.all
    @price = client.price(stocks[index].symbol)
  end
end
