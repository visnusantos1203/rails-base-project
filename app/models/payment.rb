require 'csv'

class Payment < ApplicationRecord
  validates :quantity, :current_price, :time_placed, :transaction_type, :user_id, :wallet_id, presence: true
  belongs_to :user
  belongs_to :wallet

  def self.to_csv
    attributes = %W{id user_id transaction_type quantity current_price stock_id time_placed}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |transaction|
        csv << attributes.map { |attr| transaction.send(attr) }
      end
    end
  end

  scope :asc_time_placed, -> { order("payments.time_placed ASC")}
  scope :desc_time_placed, -> { order("payments.time_placed DESC")}
  scope :asc_transaction_type, -> { order("transaction_type ASC")}
  scope :desc_transaction_type, -> { order("transaction_type DESC")}
  scope :asc_amount, -> { order("payments.quantity * payments.current_price ASC")}
  scope :desc_amount, -> { order("payments.quantity * payments.current_price DESC")}
  scope :costs_more_than, -> (amount) { where("quantity * current_price > ?", amount) }
end
