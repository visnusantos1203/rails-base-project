class AddBalanceToWallet < ActiveRecord::Migration[6.0]
  def change
    add_column :wallets, :balance, :decimal
  end
end
