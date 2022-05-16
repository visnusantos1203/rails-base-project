class PaymentHandler

  def self.deduct_payment(amount, user_id)
    user_wallet = Wallet.where(user_id: user_id)[0]
    user_wallet.balance = user_wallet.balance - amount
    user_wallet.save
  end

  def self.top_up(amount, user_id)
    user_wallet = Wallet.where(user_id: user_id)[0]
    user_wallet.balance = user_wallet.balance + amount
    user_wallet.save
  end

end