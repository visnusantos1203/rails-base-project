class RemoveUserTypeAndStatusFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_type, :string
    remove_column :users, :status, :string
  end
end
