class Payment < ApplicationRecord
  validates :quantity, :current_price, :time_placed, :transaction_type, :user_id, :stock_id, :wallet_id, presence: true
  belongs_to :user
  belongs_to :stock
  belongs_to :wallet

  scope :asc_time_placed, -> { order("payments.time_placed ASC")}
  scope :desc_time_placed, -> { order("payments.time_placed DESC")}
  scope :asc_transaction_type, -> { order("transaction_type ASC")}
  scope :desc_transaction_type, -> { order("transaction_type DESC")}
  scope :asc_amount, -> { order("payments.quantity * payments.current_price ASC")}
  scope :desc_amount, -> { order("payments.quantity * payments.current_price DESC")}
end
