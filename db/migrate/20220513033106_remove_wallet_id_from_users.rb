class RemoveWalletIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :wallet_id, :integer
  end
end
