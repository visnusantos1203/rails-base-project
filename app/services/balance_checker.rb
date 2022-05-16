class BalanceChecker  
 def self.enough_balance(amount, user_id)
  user_balance = Wallet.where(user_id: user_id)[0].balance
  if user_balance > amount
    return true
  else
    return false
  end
 end
end