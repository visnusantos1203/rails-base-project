class RemovePaymentIdFromStock < ActiveRecord::Migration[6.0]
  def change
    remove_column :stocks, :payment_id, :integer
  end
end
