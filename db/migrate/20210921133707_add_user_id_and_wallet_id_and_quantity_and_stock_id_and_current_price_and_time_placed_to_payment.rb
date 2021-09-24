class AddUserIdAndWalletIdAndQuantityAndStockIdAndCurrentPriceAndTimePlacedToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :user_id, :integer
    add_column :payments, :wallet_id, :integer
    add_column :payments, :quantity, :decimal
    add_column :payments, :stock_id, :integer
    add_column :payments, :current_price, :decimal
    add_column :payments, :time_placed, :timestamp
  end
end
