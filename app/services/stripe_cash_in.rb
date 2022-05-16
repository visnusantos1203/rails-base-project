class StripeCashIn

  def self.perform(amount, currency = "usd")
    Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: 'Cash In',
        amount: (amount + "00").to_i,
        currency: currency,
        quantity: 1
      }],
      mode: 'payment',
      success_url: "http://localhost:3000",
      cancel_url: "http://localhost:3000",
    })
    
  end
end