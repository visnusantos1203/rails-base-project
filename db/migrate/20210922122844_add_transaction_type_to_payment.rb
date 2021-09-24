class AddTransactionTypeToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :transaction_type, :string
  end
end
