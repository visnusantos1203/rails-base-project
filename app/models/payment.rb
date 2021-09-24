class Payment < ApplicationRecord
  validates :quantity, :current_price, :time_placed, :transaction_type, :user_id, :stock_id, :wallet_id, presence: true
  belongs_to :user
  belongs_to :stock
  belongs_to :wallet
end
